# Carsome Used Cars — Sample

A 10-row snapshot of public Carsome used-car listings from Indonesia, collected on
**29 October 2026**.

- `sample-2026-10-29.json` — 10 records, UTF-8 JSON array
- `sample-2026-10-29.csv` — same records as CSV
- Schema: [`../../schemas/carsome-listing.schema.json`](../../schemas/carsome-listing.schema.json)

## Fields

| Field | Description |
|---|---|
| `itemId` | Carsome listing ID (stable key) |
| `itemName` | Full vehicle listing title |
| `itemUrl` | Canonical public listing URL |
| `brand`, `model`, `year` | Vehicle identity |
| `mileageKm` | Odometer reading in kilometers |
| `priceIdr`, `currency` | Asking price and currency |
| `transmission`, `fuelType`, `color` | Vehicle attributes |
| `dealer` | Selling dealer / location |
| `country` | Market code (`id`, `my`, `sg`, `th`) |
| `sourceLabel`, `scrapedAt` | Source marker and extraction timestamp |

## Method and limitations

- Public Carsome listing pages only; no login.
- 10 rows from an Indonesia inventory page — a schema sample, not a market sample.
- Asking prices, not transaction prices; inventory changes frequently.
- `priceIdr` is retained as the field name for compatibility; always read `currency` with it.
- Dealer names are business names; no individual seller contact data is included.

## Source and tool

- Original marketplace: <https://www.carsome.id/beli-mobil-bekas>
- Actor: <https://apify.com/matakupanlabs/carsome-used-car-scraper>
