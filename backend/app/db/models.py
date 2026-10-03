from sqlalchemy import ForeignKey, String, Text, UniqueConstraint
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship


class Base(DeclarativeBase):
    pass


class Act(Base):
    __tablename__ = "acts"

    id: Mapped[int] = mapped_column(primary_key=True)
    eli: Mapped[str] = mapped_column(String(64), unique=True)  # e.g. "DU/2024/1539"
    title: Mapped[str] = mapped_column(Text)  # full official title
    short_title: Mapped[str | None] = mapped_column(Text)  # e.g. "Kodeks karny"

    articles: Mapped[list["Article"]] = relationship(back_populates="act")


class Article(Base):
    __tablename__ = "articles"
    __table_args__ = (UniqueConstraint("act_id", "number"),)

    id: Mapped[int] = mapped_column(primary_key=True)
    act_id: Mapped[int] = mapped_column(ForeignKey("acts.id", ondelete="CASCADE"))
    number: Mapped[str] = mapped_column(String(32))
    text: Mapped[str] = mapped_column(Text)

    act: Mapped[Act] = relationship(back_populates="articles")
