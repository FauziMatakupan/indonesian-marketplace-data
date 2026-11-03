# Indonesian Marketplace Data — Schemas & Samples

[![validate](https://github.com/FauziMatakupan/indonesian-marketplace-data/actions/workflows/validate.yml/badge.svg)](https://github.com/FauziMatakupan/indonesian-marketplace-data/actions/workflows/validate.yml)
[![release](https://img.shields.io/github/v/release/FauziMatakupan/indonesian-marketplace-data)](https://github.com/FauziMatakupan/indonesian-marketplace-data/releases)
[![license: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![data: CC BY 4.0](https://img.shields.io/badge/data-CC%20BY%204.0-brightgreen.svg)](LICENSE-DATA)

Open schema notes and small, real sample datasets for Indonesian marketplaces:
**OLX Indonesia**, four Indonesian job boards, and **Carsome** used cars.

The goal is simple: make Indonesian marketplace data easier to model. Stable marketplace
IDs, prices in IDR, normalized locations, explicit nulls, and documented limitations —
instead of one-off CSV exports with inconsistent columns.

These samples are snapshots, not live feeds. They are intended for schema review,
prototyping, and teaching. For recurring collection, use the Actors linked below.

## Datasets

| Dataset | Rows | Snapshot | Files |
|---|---|---|---|
| OLX Indonesia listings | 25 | 2026-11-03 | [JSON](datasets/olx-indonesia/sample-2026-11-03.json) · [CSV](datasets/olx-indonesia/sample-2026-11-03.csv) |
| Indonesian job boards (4 portals) | 8 | 2026-11-03 | [JSON](datasets/job-boards/sample-2026-11-03.json) · [CSV](datasets/job-boards/sample-2026-11-03.csv) |
| Carsome used cars | 10 | 2026-10-29 | [JSON](datasets/carsome/sample-2026-10-29.json) · [CSV](datasets/carsome/sample-2026-10-29.csv) |

Every dataset has a README with method, field notes, and limitations.

## Schemas

| Schema | Use |
|---|---|
| [olx-listing.schema.json](schemas/olx-listing.schema.json) | One OLX Indonesia classified listing |
| [job-listing.schema.json](schemas/job-listing.schema.json) | One job record across Glints, Kalibrr, Dealls, Pintarnya |
| [carsome-listing.schema.json](schemas/carsome-listing.schema.json) | One Carsome used-car listing |

The schemas are JSON Schema draft-07. Versioning notes live in
[schemas/README.md](schemas/README.md).

## Quick start

```bash
git clone https://github.com/FauziMatakupan/indonesian-marketplace-data.git
cd indonesian-marketplace-data

# Inspect the first OLX record
jq '.[0]' datasets/olx-indonesia/sample-2026-11-03.json

# Load the CSV in Python
python -c "import pandas as pd; print(pd.read_csv('datasets/job-boards/sample-2026-11-03.csv').head())"
```

## Design rules

1. **Keep the marketplace ID.** Titles, prices, and statuses change; the marketplace ID is
   the stable key for deduplication.
2. **Separate numeric and display prices.** `price` is for aggregation; `priceDisplay` is
   for QA against the source.
3. **Normalize location into a hierarchy.** `country → region/province → city → district`
   beats a single free-text field.
4. **Use `null`, not guesses.** Missing salary, condition, or mileage is `null`, never `0`.
5. **Record the snapshot time.** A row without `scrapedAt` cannot be trusted in a time
   series.
6. **Separate source flags from verified facts.** `sellerKyc` is the marketplace's flag,
   not an independent verification.

## Scope and limitations

- Small, keyword-specific samples — **not** representative market samples.
- Asking prices, not transaction prices.
- Listings can be sold, removed, or republished; snapshots age quickly.
- Seller-written descriptions may contain typos, emoji, or promotional text.
- Seller names and exact coordinates are omitted from the public samples.

Read [ETHICS.md](ETHICS.md) before using or extending these datasets.

## Related tools

I maintain Apify Actors that produce these schemas:

- [OLX Indonesia Listings Scraper](https://apify.com/matakupanlabs/olx-indonesia-listings-scraper)
- [Indonesia Jobs Scraper — 4 job boards](https://apify.com/matakupanlabs/indonesia-tech-jobs-scraper)
- [Carsome Used Car Scraper](https://apify.com/matakupanlabs/carsome-used-car-scraper)

**Disclosure:** these are my Actors and they are pay-per-result. The sample datasets and
schemas in this repository are free.

Background article: [Scraping OLX Indonesia past Akamai](https://dev.to/fauzimatakupan/scraping-olx-indonesia-past-akamai-architecture-notes-and-a-25-row-sample-dataset-11jd)

## Contributing

Issues and pull requests are welcome — especially schema critiques, field suggestions, and
additional public sample rows that do not contain personal data. See
[CONTRIBUTING.md](CONTRIBUTING.md).

## License

- Code and JSON Schemas: [MIT](LICENSE)
- Dataset samples: [CC BY 4.0](LICENSE-DATA)

## Disclaimer

This project is independent and is **not affiliated with OLX, Carsome, Glints, Kalibrr,
Dealls, or Pintarnya**. Marketplace names are used only to identify the source of the data.
