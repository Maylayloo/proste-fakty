"""Run the ingestion pipeline once: `uv run python -m app.pipeline [--force] [--dir pdfs]`."""

import argparse
import asyncio
import logging

from app.db.session import engine
from app.pipeline.run import run_pipeline


async def main() -> None:
    parser = argparse.ArgumentParser(description="PDF -> Postgres -> Qdrant ingestion")
    parser.add_argument("--dir", help="folder with PDFs (default: settings.pdf_dir)")
    parser.add_argument("--force", action="store_true", help="re-process already finished PDFs")
    args = parser.parse_args()

    try:
        report = await run_pipeline(args.dir, force=args.force)
    finally:
        await engine.dispose()

    print(f"discovered: {report.discovered}")
    print(f"silver:     {report.to_silver}")
    print(f"gold:       {report.to_gold}")
    for name, error in report.failed.items():
        print(f"FAILED {name}: {error}")


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s: %(message)s")
    asyncio.run(main())
