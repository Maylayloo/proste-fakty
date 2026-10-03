from datetime import date
from typing import Literal

from pydantic import BaseModel, ConfigDict, Field


class Page[T](BaseModel):
    items: list[T]
    page: int
    page_size: int
    total: int
    pages: int


class SittingListItem(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    number: int
    title: str
    start_date: date
    end_date: date
    status: Literal["planned", "in_progress", "finished"]
    description: str | None = Field(description="Short plain-language summary of the sitting; null until generated")
    votings_count: int
