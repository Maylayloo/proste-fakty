from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine

from app.config import settings

engine = create_async_engine(settings.async_database_url, pool_pre_ping=True)

SessionFactory = async_sessionmaker[AsyncSession]
session_factory: SessionFactory = async_sessionmaker(engine, expire_on_commit=False)
