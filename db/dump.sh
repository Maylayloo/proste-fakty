#!/usr/bin/env sh
# Refresh db/seed.sql from the running postgres container: the sittings table
# (the list endpoint with its Gemini descriptions).
set -eu
cd "$(dirname "$0")/.."
docker compose exec -T postgres sh -c 'pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" --no-owner --no-privileges -t sittings' > db/seed.sql.tmp
mv db/seed.sql.tmp db/seed.sql
