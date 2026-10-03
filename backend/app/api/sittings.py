from collections.abc import AsyncIterator
from typing import Annotated

import httpx
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession

from app.config import settings
from app.db.session import session_factory
from app.schemas.sittings import Page, SittingListItem
from app.services import sittings as service
from app.services.sejm_client import SejmClient, get_sejm_client

router = APIRouter(prefix="/api/v1/sittings", tags=["sittings"])


async def get_session() -> AsyncIterator[AsyncSession]:
    async with session_factory() as session:
        yield session


SessionDep = Annotated[AsyncSession, Depends(get_session)]
SejmDep = Annotated[SejmClient, Depends(get_sejm_client)]

SEJM_UNAVAILABLE = HTTPException(502, "Sejm API is unavailable and this data is not stored yet")


@router.get("", summary="Paged list of Sejm sittings, newest first")
async def list_sittings(
    session: SessionDep,
    sejm: SejmDep,
    page: Annotated[int, Query(ge=1)] = 1,
    page_size: Annotated[int, Query(ge=1, le=100)] = 3,
) -> Page[SittingListItem]:
    try:
        return await service.list_sittings(session, sejm, settings.sejm_term, page, page_size)
    except httpx.HTTPError as exc:
        raise SEJM_UNAVAILABLE from exc
