"""Celery + beat schedule for the ingestion pipeline. Not used yet - run `python -m app.pipeline` instead.

Start with:  docker compose --profile celery up
"""

from celery import Celery
from celery.schedules import crontab

from app.config import settings

celery_app = Celery("proste_fakty", broker=settings.celery_broker_url)
celery_app.conf.update(
    timezone="Europe/Warsaw",
    task_acks_late=True,
    worker_prefetch_multiplier=1,
    beat_schedule={
        "ingest-pdfs-hourly": {
            "task": "pipeline.ingest_pdfs",
            "schedule": crontab(minute=0),
        },
    },
)


@celery_app.task(name="pipeline.ingest_pdfs")
def ingest_pdfs(force: bool = False) -> dict:
    from app.db.session import engine, run_async
    from app.pipeline.run import run_pipeline
    from app.utils.gemini_client.client import GeminiClient

    async def _run() -> dict:
        # Fresh client and pool per run: each task gets its own event loop.
        client = GeminiClient(api_key=settings.gemini_api_key, model=settings.gemini_model)
        try:
            report = await run_pipeline(force=force, client=client)
        finally:
            await engine.dispose()
        return {"discovered": report.discovered, "gold": report.to_gold, "failed": report.failed}

    return run_async(_run())
