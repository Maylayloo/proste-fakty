#!/usr/bin/env sh
# Load the shared seed data (made by db/dump.sh) into the local Docker containers.
#
#   qdrant:   always restored from db/qdrant/act_articles.snapshot (replaces the collection).
#   postgres: db/seed.sql is loaded automatically when the postgres volume is first created. For an existing
#             volume pass --postgres: it DROPS every seed table (sittings, votings, bills, acts, ...) and reloads them.
#
# Usage, from anywhere in the repo:
#   Git Bash / Linux / macOS:   sh db/restore.sh [--postgres]
#   Windows PowerShell / cmd:   powershell -ExecutionPolicy Bypass -File db\restore.ps1 [-Postgres]
# Step-by-step guide: db/README.md
set -eu
cd "$(dirname "$0")/.."
export MSYS_NO_PATHCONV=1 # Git Bash: do not rewrite container paths like /tmp/seed.sql into Windows paths

QDRANT_URL="${QDRANT_URL:-http://localhost:6333}"
COLLECTION=act_articles
TABLES="articles, acts, source_documents, voting_club_results, votings, bills, sittings"

fail() {
    echo "ERROR: $*" >&2
    exit 1
}

docker info > /dev/null 2>&1 || fail "Docker is not running - start Docker Desktop and try again."

echo "starting postgres + qdrant..."
docker compose up -d postgres qdrant

i=0
until [ "$(docker compose ps postgres --format '{{.Health}}')" = "healthy" ]; do
    i=$((i + 1))
    [ "$i" -gt 60 ] && fail "postgres did not become healthy - check: docker compose logs postgres"
    sleep 2
done
i=0
until curl -sf "$QDRANT_URL/readyz" > /dev/null; do
    i=$((i + 1))
    [ "$i" -gt 30 ] && fail "qdrant did not start - check: docker compose logs qdrant (old storage? see db/README.md)"
    sleep 2
done

if [ "${1:-}" = "--postgres" ]; then
    echo "reloading postgres from db/seed.sql..."
    docker compose cp db/seed.sql postgres:/tmp/seed.sql
    echo "DROP TABLE IF EXISTS $TABLES CASCADE;" \
        | docker compose exec -T postgres sh -c 'psql -q -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB"'
    docker compose exec -T postgres sh -c \
        'psql -q -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /tmp/seed.sql > /dev/null; status=$?; rm -f /tmp/seed.sql; exit $status' \
        || fail "loading db/seed.sql failed (see the psql error above)"
    echo "postgres <- db/seed.sql"
fi

echo "restoring qdrant from db/qdrant/$COLLECTION.snapshot..."
response=$(curl -sS -X POST "$QDRANT_URL/collections/$COLLECTION/snapshots/upload?priority=snapshot&wait=true" \
    -F "snapshot=@db/qdrant/$COLLECTION.snapshot") || fail "qdrant not reachable at $QDRANT_URL"
case "$response" in
    *'"status":"ok"'*) echo "qdrant   <- db/qdrant/$COLLECTION.snapshot" ;;
    *) fail "qdrant restore failed: $response" ;;
esac

articles=$(echo "SELECT count(*) FROM articles;" \
    | docker compose exec -T postgres sh -c 'psql -tA -U "$POSTGRES_USER" -d "$POSTGRES_DB"' 2> /dev/null || echo "?")
points=$(curl -s "$QDRANT_URL/collections/$COLLECTION" | sed -n 's/.*"points_count":\([0-9]*\).*/\1/p')
echo "done: postgres articles=$articles, qdrant points=$points"
