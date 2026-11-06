#!/usr/bin/env bash
# Menyalin sampel dataset + schema ke docs/downloads agar GitHub Pages
# (source: /docs) bisa menyajikannya sebagai unduhan langsung.
set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p docs/downloads

cp datasets/olx-indonesia/sample-2026-11-03.json       docs/downloads/olx-sample-2026-11-03.json
cp datasets/olx-indonesia/sample-2026-11-03.csv        docs/downloads/olx-sample-2026-11-03.csv
cp datasets/job-boards/sample-2026-11-03.json          docs/downloads/jobs-sample-2026-11-03.json
cp datasets/job-boards/sample-2026-11-03.csv           docs/downloads/jobs-sample-2026-11-03.csv
cp datasets/carsome/sample-2026-10-29.json             docs/downloads/carsome-sample-2026-10-29.json
cp datasets/carsome/sample-2026-10-29.csv              docs/downloads/carsome-sample-2026-10-29.csv
cp datasets/dubai-propertyfinder/sample-2026-11-06.json docs/downloads/dubai-sample-2026-11-06.json
cp datasets/dubai-propertyfinder/sample-2026-11-06.csv  docs/downloads/dubai-sample-2026-11-06.csv

cp schemas/olx-listing.schema.json             docs/downloads/
cp schemas/job-listing.schema.json             docs/downloads/
cp schemas/carsome-listing.schema.json         docs/downloads/
cp schemas/dubai-property-listing.schema.json  docs/downloads/

echo "Synced $(ls docs/downloads | wc -l) files to docs/downloads/"
