# Indonesian Job Boards — Unified Sample

An 8-row sample of the unified job schema across four Indonesian job boards:
**Glints**, **Kalibrr**, **Dealls**, and **Pintarnya**. Two records per portal, collected
on **3 November 2026** for the keyword `data analyst` in Indonesia.

- `sample-2026-11-03.json` — 8 records, UTF-8 JSON array
- `sample-2026-11-03.csv` — same records as CSV
- Schema: [`../../schemas/job-listing.schema.json`](../../schemas/job-listing.schema.json)

## Why a unified schema

Each portal uses different field names, salary formats, and location strings. This sample
shows one normalized shape so datasets from multiple portals can be merged without
remapping:

- one `portal` value to identify the source;
- one `id` with a portal prefix for deduplication;
- one `salary` object (`min`, `max`, `currency`, `interval`, `isShown`);
- one location hierarchy (`country`, `province`, `city`);
- one `workArrangement` and `employmentType` vocabulary.

## Fields

| Field | Description |
|---|---|
| `id` | Unique record ID, prefixed by portal |
| `portal` | `glints`, `kalibrr`, `dealls`, or `pintarnya` |
| `jobTitle`, `companyName` | Role and employer |
| `companyIndustry`, `companyWebsite`, `companyLogo` | Employer metadata when available |
| `workArrangement` | `ONSITE`, `REMOTE`, `HYBRID`, or `null` |
| `employmentType` | `FULL_TIME`, `PART_TIME`, `CONTRACT`, `INTERNSHIP`, or `null` |
| `location`, `city`, `province`, `country` | Normalized placement |
| `salary` | `{min, max, currency, interval, isShown}` or `null` |
| `minExperienceYears`, `educationLevel` | Requirements when published |
| `skills`, `perks` | Arrays when published |
| `hrResponseRate` | Portal-provided response metric, when available |
| `jobDescription`, `jobQualifications` | Full text in a live run; nulled in this sample |
| `jobUrl`, `postedAt`, `applicationDeadline`, `scrapedAt` | Source links and timestamps |

## Method and limitations

- Public listing pages/APIs only; no login.
- Two records per portal, one keyword — this validates the schema, not the market.
- `jobDescription` and `jobQualifications` are set to `null` in this public sample to keep
  it small and avoid carrying free-text personal data.
- Salary is `null` when the portal does not publish it; `isShown` is `false` when only a
  partial range is available.

## Source and tool

- Portals: [Glints](https://glints.com), [Kalibrr](https://www.kalibrr.com),
  [Dealls](https://dealls.com), [Pintarnya](https://pintarnya.com)
- Actor: <https://apify.com/matakupanlabs/indonesia-tech-jobs-scraper>
