import asyncio
import logging
from collections.abc import AsyncIterator
from contextlib import asynccontextmanager

import psycopg
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from qdrant_client import QdrantClient

from app.api import sittings
from app.config import settings
from app.db.models import Base
from app.db.session import engine
from app.services import articles as articles_service

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(_: FastAPI) -> AsyncIterator[None]:
    # No migrations yet: create missing tables on startup. Replace with alembic once the schema settles.
    try:
        async with engine.begin() as conn:
            await conn.run_sync(Base.metadata.create_all)
    except Exception:
        logger.exception("Could not create database tables")
    # Load the embedding model in the background so the first article search does not wait for it.
    warm_up = asyncio.create_task(asyncio.to_thread(articles_service.warm_up))
    yield
    warm_up.cancel()


app = FastAPI(title="Proste Fakty API", lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origins,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(sittings.router)


@app.get("/health")
def health() -> dict[str, str]:
    status = {"api": "ok"}

    try:
        with psycopg.connect(settings.database_url, connect_timeout=3) as conn:
            conn.execute("SELECT 1")
        status["postgres"] = "ok"
    except Exception as e:
        status["postgres"] = f"error: {e}"

    try:
        QdrantClient(url=settings.qdrant_url, timeout=3).get_collections()
        status["qdrant"] = "ok"
    except Exception as e:
        status["qdrant"] = f"error: {e}"

    return status
