#!/usr/bin/env sh
# Load the shared seed data (made by db/dump.sh) into the running containers.
#
#   postgres: db/seed.sql is loaded automatically when the postgres volume is created. For an existing
#             volume pass --postgres: it DROPS every table of the seed (sittings, votings, bills, acts, ...) and reloads them.
#   qdrant:   always restored from db/qdrant/act_articles.snapshot (replaces the collection).
#
# Usage: db/restore.sh [--postgres]
set -eu
cd "$(dirname "$0")/.."

QDRANT_URL="${QDRANT_URL:-http://localhost:6333}"
COLLECTION=act_articles

if [ "${1:-}" = "--postgres" ]; then
    docker compose exec -T postgres sh -c 'psql -q -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" \
        -c "DROP TABLE IF EXISTS articles, acts, source_documents, voting_club_results, votings, bills, sittings CASCADE"'
    docker compose exec -T postgres sh -c 'psql -q -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB"' < db/seed.sql
    echo "postgres <- db/seed.sql"
fi

curl -sf -X POST "$QDRANT_URL/collections/$COLLECTION/snapshots/upload?priority=snapshot&wait=true" \
    -F "snapshot=@db/qdrant/$COLLECTION.snapshot" > /dev/null
echo "qdrant   <- db/qdrant/$COLLECTION.snapshot"
