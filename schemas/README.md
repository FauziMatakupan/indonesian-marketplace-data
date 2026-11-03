# Schemas

JSON Schema draft-07 definitions for the sample datasets in this repository.

| File | Record |
|---|---|
| `olx-listing.schema.json` | One OLX Indonesia classified listing |
| `job-listing.schema.json` | One job record across Glints, Kalibrr, Dealls, Pintarnya |
| `carsome-listing.schema.json` | One Carsome used-car listing |

## Conventions

- **Stable IDs:** every record has a marketplace-derived ID (`adId`, `id`, `itemId`).
- **Nulls over sentinels:** missing values are `null`, never `0`, `""`, or `"N/A"`.
- **Prices:** numeric price + currency; display price is a separate field.
- **Timestamps:** ISO 8601 strings where the source provides them.
- **Enums:** `portal`, `workArrangement`, and `employmentType` use a fixed vocabulary.
- **No PII:** schemas do not require seller names, phone numbers, emails, or exact
  coordinates.

## Validation

Python:

```bash
pip install jsonschema
python - <<'PY'
import json
from jsonschema import validate
schema = json.load(open('schemas/olx-listing.schema.json'))
rows = json.load(open('datasets/olx-indonesia/sample-2026-11-03.json'))
for row in rows:
    validate(row, schema)
print(f'{len(rows)} rows valid')
PY
```

Node:

```bash
npx ajv-cli validate -s schemas/job-listing.schema.json -d datasets/job-boards/sample-2026-11-03.json
```

## Versioning

Schemas are versioned by Git history. A breaking change must include:

1. a migration note in this file,
2. an updated sample dataset,
3. a new snapshot date in the dataset filename.
