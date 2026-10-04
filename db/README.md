# Shared data: Postgres seed + Qdrant snapshot

| File | What | Made by |
|---|---|---|
| `db/seed.sql` | Postgres: sittings, bills, votings, voting club results, acts, articles (with Gemini summaries), pipeline tracking | `db/dump.sh` |
| `db/qdrant/act_articles.snapshot` | Qdrant: the `act_articles` collection (article embeddings for search) | `db/dump.sh` |

## Load the data on your machine

**You need:** Docker Desktop running, and this repo pulled (`git pull`).

### Windows (PowerShell or cmd)

1. Open PowerShell or cmd in the repo folder.
2. Run:

   ```
   powershell -ExecutionPolicy Bypass -File db\restore.ps1 -Postgres
   ```

### Git Bash / Linux / macOS

1. Open a terminal in the repo folder (on Windows: **Git Bash**, not WSL).
2. Run:

   ```
   sh db/restore.sh --postgres
   ```

The script starts Postgres and Qdrant, waits for them, loads both files and ends with:

```
done: postgres articles=682, qdrant points=15
```

(The numbers grow as more acts are added.) Without `-Postgres` / `--postgres` only Qdrant is restored.

> `-Postgres` / `--postgres` **drops and reloads** sittings, bills, votings, voting_club_results, acts, articles and
> source_documents. Anything you added to those tables locally is replaced by the shared data.

### Check it

- Qdrant dashboard: http://localhost:6333/dashboard → Collections → `act_articles`
- Start the backend (from `backend/`): `uv run python -m app.main`, then open http://localhost:8000/health - all `ok`

## Share your data with the others

After adding acts (pipeline) or new sittings, with Postgres and Qdrant running, from the repo root in Git Bash:

```
sh db/dump.sh
```

Commit `db/seed.sql` and `db/qdrant/act_articles.snapshot` **together**, so the two databases stay in sync.

## Troubleshooting

| Problem | Fix |
|---|---|
| `ERROR: Docker is not running` | Start Docker Desktop, wait until it says it is running, run the script again. |
| Git Bash: `set: Illegal option -` or `$'\r': command not found` | Old checkout with Windows line endings. Run once: `sed -i 's/\r$//' db/restore.sh db/dump.sh` (new checkouts are fixed by `.gitattributes`). |
| `qdrant restore failed: ...` mentioning the version / format | Your Qdrant is older than the one that made the snapshot. `docker compose pull qdrant`, then run the script again. |
| `qdrant did not start` | Its old storage may not open in the new version. The snapshot recreates everything, so reset only Qdrant's volume: `docker compose rm -sf qdrant`, then `docker volume ls` and `docker volume rm <folder>_qdrant_data`, then run the script again. |
| `password authentication failed` in the backend, `postgres` is fine in the script | A local (non-Docker) Postgres also listens on port 5432. Either stop that Windows service, or publish the container on 5433: create `docker-compose.override.yml` (git-ignored) with `services: postgres: ports: ["5433:5432"]` and set `POSTGRES_PORT=5433` in `.env`. |
| Anything in WSL | Run the scripts and `uv` from Windows (PowerShell / cmd / Git Bash), not WSL. |
