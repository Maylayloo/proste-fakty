<#
Load the shared seed data (made by db/dump.sh) into the local Docker containers - Windows version of db/restore.sh.

  qdrant:   always restored from db/qdrant/act_articles.snapshot (replaces the collection).
  postgres: db/seed.sql is loaded automatically when the postgres volume is first created. For an existing
            volume pass -Postgres: it DROPS every seed table (sittings, votings, bills, acts, ...) and reloads them.

Usage, from anywhere (PowerShell or cmd):
  powershell -ExecutionPolicy Bypass -File db\restore.ps1 [-Postgres]
Step-by-step guide: db/README.md
#>
param([switch]$Postgres)

# Not 'Stop': in Windows PowerShell 5.1 any stderr output of docker/curl would then abort the script.
$ErrorActionPreference = 'Continue'
Set-Location (Join-Path $PSScriptRoot '..')

$QdrantUrl = if ($env:QDRANT_URL) { $env:QDRANT_URL } else { 'http://localhost:6333' }
$Collection = 'act_articles'
$Tables = 'articles, acts, source_documents, voting_club_results, votings, bills, sittings'

function Fail([string]$Message) {
    Write-Host "ERROR: $Message" -ForegroundColor Red
    exit 1
}

docker info > $null 2>&1
if ($LASTEXITCODE -ne 0) { Fail 'Docker is not running - start Docker Desktop and try again.' }

Write-Host 'starting postgres + qdrant...'
docker compose up -d postgres qdrant
if ($LASTEXITCODE -ne 0) { Fail 'docker compose up failed (see above)' }

$tries = 0
while ((docker compose ps postgres --format '{{.Health}}') -ne 'healthy') {
    $tries++
    if ($tries -gt 60) { Fail 'postgres did not become healthy - check: docker compose logs postgres' }
    Start-Sleep -Seconds 2
}
$tries = 0
while ($true) {
    try { Invoke-RestMethod "$QdrantUrl/readyz" -TimeoutSec 3 | Out-Null; break } catch { }
    $tries++
    if ($tries -gt 30) { Fail 'qdrant did not start - check: docker compose logs qdrant (old storage? see db/README.md)' }
    Start-Sleep -Seconds 2
}

if ($Postgres) {
    Write-Host 'reloading postgres from db/seed.sql...'
    # Copy the file into the container instead of piping it: PowerShell pipes would garble Polish characters.
    docker compose cp db/seed.sql postgres:/tmp/seed.sql
    if ($LASTEXITCODE -ne 0) { Fail 'could not copy db/seed.sql into the postgres container' }
    "DROP TABLE IF EXISTS $Tables CASCADE;" | docker compose exec -T postgres sh -c 'psql -q -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $POSTGRES_DB'
    if ($LASTEXITCODE -ne 0) { Fail 'dropping the old tables failed (see the psql error above)' }
    docker compose exec -T postgres sh -c 'psql -q -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $POSTGRES_DB -f /tmp/seed.sql > /dev/null; status=$?; rm -f /tmp/seed.sql; exit $status'
    if ($LASTEXITCODE -ne 0) { Fail 'loading db/seed.sql failed (see the psql error above)' }
    Write-Host 'postgres <- db/seed.sql'
}

Write-Host "restoring qdrant from db/qdrant/$Collection.snapshot..."
$response = curl.exe -sS -X POST "$QdrantUrl/collections/$Collection/snapshots/upload?priority=snapshot&wait=true" -F "snapshot=@db/qdrant/$Collection.snapshot"
if ($LASTEXITCODE -ne 0) { Fail "qdrant not reachable at $QdrantUrl" }
if ("$response" -notmatch '"status":"ok"') { Fail "qdrant restore failed: $response" }
Write-Host "qdrant   <- db/qdrant/$Collection.snapshot"

$articles = 'SELECT count(*) FROM articles;' | docker compose exec -T postgres sh -c 'psql -tA -U $POSTGRES_USER -d $POSTGRES_DB'
$points = (Invoke-RestMethod "$QdrantUrl/collections/$Collection").result.points_count
Write-Host "done: postgres articles=$articles, qdrant points=$points" -ForegroundColor Green
