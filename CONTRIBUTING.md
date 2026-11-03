# Contributing

Thanks for helping improve Indonesian marketplace data modeling.

## Good contributions

- Schema critiques: unclear field names, missing types, wrong nullability.
- New **public** sample rows that do not contain personal data.
- Documentation fixes: method notes, limitations, validation examples.
- Small validation scripts or tests.

## Please do not

- Add seller names, phone numbers, emails, or exact coordinates.
- Add data from login-only pages, private messages, or paywalled sources.
- Add large scraped dumps. This repository is for small, reviewable samples.
- Add promotional links unrelated to the datasets.

## Pull request checklist

1. Update the relevant dataset README and schema if fields change.
2. Keep JSON valid and CSV UTF-8.
3. Run the validation example in `schemas/README.md`.
4. State the snapshot date and source URL.
5. Confirm the sample contains no personal data.

## License of contributions

By contributing, you agree that code and schemas are licensed under MIT, and dataset
samples are provided under the terms in [LICENSE-DATA](LICENSE-DATA).
