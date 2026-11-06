# Dubai / UAE property listings — sample

**Snapshot:** 2026-11-06 · **Rows:** 40 · **Source:** public PropertyFinder search results
(Dubai, sale and rent).

## What this is

A small, real sample of Dubai property listings normalized into one flat record. It exists
so analysts can review the schema before committing to a feed, and so prototypes can be
built without scraping anything first.

This is a snapshot, not a live feed. Prices and availability change daily.

## Method

1. Public search pages on `propertyfinder.ae` were opened in a real browser.
2. Listings rendered by the page were captured and mapped into the fields below.
3. Records were deduplicated by `listingId`.
4. Contact data was removed before publication (see Privacy).

## Fields

| Field | Notes |
|---|---|
| `listingId` | Stable portal id; dedupe across runs on this key |
| `url` | Canonical public listing URL |
| `name` | Broker-written headline |
| `price`, `currency`, `pricePeriod` | Asking price; AED for Dubai; period for rentals |
| `transactionType`, `propertyType` | Sale/rent; apartment, villa, townhouse, … |
| `bedrooms`, `bathrooms` | Studios are `bedrooms: 0` |
| `sizeSqft`, `sizeSqm` | Built-up area in both units |
| `pricePerArea` | Portal-computed; `null` when absent |
| `city`, `community`, `subCommunity` | Location hierarchy |
| `completionStatus` | Ready / off-plan when exposed |
| `furnished` | Furnishing state as published |
| `isVerified`, `isExclusive`, `isNewConstruction` | Portal flags |
| `latitude`, `longitude` | Listing coordinates (approximate) |
| `listedDate`, `scrapedAt` | ISO 8601 timestamps |
| `communityAvgPrice`, `communityPriceTrend12mPct`, `communityActiveListings` | Community context at collection time |
| `rera` | Permit string when published |

## Privacy

The published sample **excludes** broker names, broker email addresses, broker phone
numbers, agent names, agent profile slugs, full descriptions, and image URLs. Only the
listing-level facts needed for market analysis are kept. Do not re-publish personal data
from the source portal; see the repository's `ETHICS.md` and `LICENSE-DATA`.

## Limitations

- 40 rows are enough to validate a schema, not to estimate the Dubai market.
- Asking prices, not transaction prices.
- Portal-computed community metrics are snapshots and may lag the listing itself.
- Duplicate units can appear under different brokers; `listingId` dedupes the portal
  record, not the underlying property.

## Recurring collection

The same schema is produced by the Apify Actor
[`matakupanlabs/dubai-property-listings-scraper`](https://apify.com/matakupanlabs/dubai-property-listings-scraper)
(pay per listing). The sample here is free.
