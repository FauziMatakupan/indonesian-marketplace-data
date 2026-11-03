#!/usr/bin/env python3
"""Validate every sample dataset against its JSON Schema."""
import json
import sys
from pathlib import Path

from jsonschema import validate

ROOT = Path(__file__).resolve().parents[1]

PAIRS = [
    ("schemas/olx-listing.schema.json", "datasets/olx-indonesia/sample-2026-11-03.json"),
    ("schemas/job-listing.schema.json", "datasets/job-boards/sample-2026-11-03.json"),
    ("schemas/carsome-listing.schema.json", "datasets/carsome/sample-2026-10-29.json"),
]


def main() -> int:
    total = 0
    for schema_path, dataset_path in PAIRS:
        schema = json.loads((ROOT / schema_path).read_text(encoding="utf-8"))
        rows = json.loads((ROOT / dataset_path).read_text(encoding="utf-8"))
        for row in rows:
            validate(row, schema)
        total += len(rows)
        print(f"OK {dataset_path}: {len(rows)} rows")
    print(f"Validated {total} rows across {len(PAIRS)} datasets.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
