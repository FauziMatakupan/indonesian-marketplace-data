# OLX Indonesia Listings — Sample

A real 25-row snapshot of public OLX Indonesia classified listings for the search query
`mechanical keyboard`, collected on **3 November 2026**.

- `sample-2026-11-03.json` — 25 records, UTF-8 JSON array
- `sample-2026-11-03.csv` — same records as CSV
- `sample-2026-11-15-1000.csv` — 1,000 records from the Komputer & Laptop category, collected on **15 November 2026**, 19 columns
- `sample-2026-11-15-1000.parquet` — same 1,000 records, typed columns
- `data-dictionary-2026-11-15.csv` — column types, missing counts, descriptions, examples
- `olx-listing.schema.json` — JSON Schema draft-07 for this dataset
- `starter-eda.ipynb` — starter notebook for price, condition, city, and item-type summaries
- Schema: [`../../schemas/olx-listing.schema.json`](../../schemas/olx-listing.schema.json)

## Fields

| Field | Description |
|---|---|
| `adId` | OLX listing ID (stable key) |
| `name` | Listing title |
| `adDescription` | Seller-written description |
| `price` | Asking price in IDR (integer) |
| `priceDisplay` | Price as displayed on OLX |
| `condition` | `Bekas` / `Baru` when provided |
| `itemType` | OLX item type label |
| `categoryId` | OLX category ID |
| `country`, `region`, `city`, `district` | Location hierarchy |
| `sellerType` | OLX seller account type |
| `sellerKyc` | OLX KYC flag, not an independent verification |
| `favorites` | Saves at collection time |
| `createdAt` | Listing creation timestamp |
| `isNew`, `status` | OLX flags and listing status |
| `url` | Canonical public listing URL |
| `query` | Search query used |

## Method

- Public search results only: `https://www.olx.co.id/items/q-mechanical-keyboard`
- One search page, collected with a real browser that lets the Akamai interstitial resolve
  naturally, then intercepts the listing JSON.
- No login, no private messages, no seller contact details.
- Seller names and exact coordinates are omitted from the public sample.

## Limitations

- 25 rows from one keyword — do not use this to estimate market prices.
- The 1,000-row file covers one category on one date. Prices are asking prices, not transaction prices, and listings may be sold or removed.
- Asking prices, not transaction prices; listings may be sold or removed.
- Duplicate or republished listings are possible; `adId` is the stable key.
- Descriptions are seller-written and may contain typos or promotional text.

## Source and tool

- Original marketplace: <https://www.olx.co.id/items/q-mechanical-keyboard>
- Actor: <https://apify.com/matakupanlabs/olx-indonesia-listings-scraper>
