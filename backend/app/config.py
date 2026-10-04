from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=("../.env", ".env"), extra="ignore")

    postgres_host: str = "localhost"
    postgres_port: int = 5432
    postgres_user: str = "postgres"
    postgres_password: str = "postgres"
    postgres_db: str = "proste_fakty"

    qdrant_url: str = "http://localhost:6333"

    cors_origins: list[str] = ["http://localhost:5173"]

    sejm_api_url: str = "https://api.sejm.gov.pl/sejm"
    sejm_term: int = 10

    gemini_api_key: str = ""
    gemini_model: str = "gemini-3.7-flash"

    # Ingestion pipeline
    pdf_dir: str = "pdfs"
    embedding_model: str = "BAAI/bge-m3"  # multilingual (Polish), 8192-token context
    chunk_max_tokens: int = 1024
    llm_concurrency: int = 8

    celery_broker_url: str = "redis://localhost:6379/0"

    @property
    def database_url(self) -> str:
        return (
            f"postgresql://{self.postgres_user}:{self.postgres_password}"
            f"@{self.postgres_host}:{self.postgres_port}/{self.postgres_db}"
        )

    @property
    def async_database_url(self) -> str:
        return self.database_url.replace("postgresql://", "postgresql+psycopg://", 1)


settings = Settings()
