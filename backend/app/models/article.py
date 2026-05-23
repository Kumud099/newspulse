from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import String, Text


class Base(DeclarativeBase):
    pass


class Article(Base):
    __tablename__ = "articles"

    id: Mapped[int] = mapped_column(primary_key=True)

    title: Mapped[str] = mapped_column(String(500))

    url: Mapped[str] = mapped_column(
        String(1000),
        unique=True
    )

    content: Mapped[str] = mapped_column(Text)