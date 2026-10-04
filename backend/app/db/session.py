import asyncio
import sys
from collections.abc import Coroutine
from typing import Any

from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine

from app.config import settings

engine = create_async_engine(settings.async_database_url, pool_pre_ping=True)

SessionFactory = async_sessionmaker[AsyncSession]
session_factory: SessionFactory = async_sessionmaker(engine, expire_on_commit=False)


async def init_db() -> None:
    """Create missing tables. Stand-in until Alembic migrations are set up."""
    from app.db.models import Base

    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)


def run_async[T](coro: Coroutine[Any, Any, T]) -> T:
    """asyncio.run for scripts. psycopg's async mode cannot use Windows' default ProactorEventLoop."""
    loop_factory = asyncio.SelectorEventLoop if sys.platform == "win32" else None
    return asyncio.run(coro, loop_factory=loop_factory)
