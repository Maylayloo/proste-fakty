#!/usr/bin/env sh
# Refresh the shared seed data from the running containers:
#   db/seed.sql                      - postgres: sittings (+ Gemini descriptions), acts, articles
#                                      (+ Gemini summaries), source_documents (pipeline tracking)
#   db/qdrant/act_articles.snapshot  - qdrant: the act_articles collection (embeddings)
# Others load them with db/restore.sh.
set -eu
cd "$(dirname "$0")/.."

QDRANT_URL="${QDRANT_URL:-http://localhost:6333}"
COLLECTION=act_articles

docker compose exec -T postgres sh -c 'pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" --no-owner --no-privileges \
    -t sittings -t acts -t articles -t source_documents' > db/seed.sql.tmp
mv db/seed.sql.tmp db/seed.sql
echo "postgres -> db/seed.sql"

mkdir -p db/qdrant
snapshot=$(curl -sf -X POST "$QDRANT_URL/collections/$COLLECTION/snapshots?wait=true" \
    | sed -n 's/.*"name":"\([^"]*\)".*/\1/p')
[ -n "$snapshot" ] || { echo "qdrant snapshot failed" >&2; exit 1; }
curl -sf -o "db/qdrant/$COLLECTION.snapshot" "$QDRANT_URL/collections/$COLLECTION/snapshots/$snapshot"
curl -sf -X DELETE "$QDRANT_URL/collections/$COLLECTION/snapshots/$snapshot" > /dev/null
echo "qdrant   -> db/qdrant/$COLLECTION.snapshot"
