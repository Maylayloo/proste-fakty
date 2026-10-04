#!/usr/bin/env sh
# Refresh db/seed.sql from the running postgres container: sittings with their Gemini descriptions,
# plus the votings, club results and bills (with Gemini summaries) already pulled for them.
set -eu
cd "$(dirname "$0")/.."
docker compose exec -T postgres sh -c 'pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" --no-owner --no-privileges \
    -t sittings -t bills -t votings -t voting_club_results' > db/seed.sql.tmp
mv db/seed.sql.tmp db/seed.sql
