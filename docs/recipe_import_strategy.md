# Recipe Import Strategy

## Background

RecipeLabo is intended to help users find recipes on the internet, save them, and iteratively adjust ingredient ratios or seasoning amounts to match personal taste.

Search result APIs are not enough for reliable automatic recipe entry. Most search APIs return only a title, URL, and short snippet. Ingredients, seasoning quantities, servings, steps, timers, images, and source metadata are not standardized in those responses.

## Product Direction

Use search APIs for discovery only, then import recipe data only when the selected source can be parsed with acceptable confidence.

Recommended flow:

1. User searches or pastes a recipe URL.
2. App shows candidate source pages.
3. Import pipeline checks for structured recipe data.
4. If structured data exists, app creates an editable draft.
5. If parsing confidence is low, app switches to assisted manual entry.
6. User reviews and confirms before saving.

The app should not silently save third-party recipe text from arbitrary pages without user review.

## Low-Cost Source Priority

### 1. Public structured recipe data

Use public recipe APIs such as FoodSafetyKorea COOKRCP01 as the first import source for Korean structured recipes.

Pros:
- Structured fields for recipe name, ingredients, cooking steps, step images, nutrition, and tips.
- Low or no API cost.
- Does not require AI parsing.

Limits:
- Coverage is limited compared with the open web.
- Public API terms and operational notices must be checked before production use.

### 2. Search APIs for URL discovery

Use Kakao Daum Search or Naver Search to find Korean recipe pages.

Pros:
- Good Korean web/blog coverage.
- Cheap or free within quota.
- Useful for letting users discover source URLs inside the app.

Limits:
- Results are not recipe records.
- Search responses should not be treated as importable recipe data.

### 3. Schema.org Recipe parsing

After the user selects a URL, fetch the page server-side and parse Schema.org `Recipe` JSON-LD or microdata when available.

Pros:
- No per-record content API cost.
- Many recipe sites expose fields such as `recipeIngredient`, `recipeInstructions`, `recipeYield`, and `image`.
- Works without AI when markup is present.

Limits:
- Not all blogs or recipe pages provide valid structured data.
- Sites may have incomplete or inconsistent markup.
- Source attribution and site terms must be respected.

### 4. Site parser fallback

Use an open-source parser such as `recipe-scrapers` from a small backend service when Schema.org parsing is insufficient.

Pros:
- No direct API cost.
- Handles many known recipe websites.
- Can extract ingredients, instructions, times, and images from supported sites.

Limits:
- Flutter should not directly depend on a Python parser.
- Parser coverage is site-specific and can break when sites change markup.
- It does not bypass bot protection.

### 5. Assisted manual entry

When structured parsing fails, show a draft entry screen where users can paste recipe text. The app can split lines into ingredient candidates and step candidates, but the user must confirm.

Pros:
- Cheap and predictable.
- Avoids false confidence from brittle scraping.
- Keeps users in control.

Limits:
- Still requires user effort.
- Without AI, mixed prose and non-standard measurements cannot be reliably normalized.

### 6. Optional AI fallback

Use AI only as a fallback for non-standard pages or pasted text.

Pros:
- Handles unstructured blog prose better than deterministic parsers.
- Can extract ingredient quantities, cooking steps, and notes into a draft.

Cost controls:
- Send only selected text or the main recipe section, not the full web page.
- Cache only user-confirmed parsed drafts.
- Always require user confirmation before saving.

Limits:
- Adds operating cost.
- Requires privacy and copyright review.
- Output can be wrong, so it must remain a draft.

## APIs To Deprioritize

### Google Custom Search JSON API

Not recommended for new product work because it is closed to new customers and existing customers have a migration deadline.

### Edamam Recipe API

Useful for search and nutrition metadata, but web recipe results generally do not include cooking instructions and caching/storage restrictions can conflict with a personal recipe-saving product.

### Spoonacular

Feature-rich but English-only, has small free quota, and has caching restrictions that make it less suitable for permanent personal recipe storage.

### TheMealDB

Good for demos or global English recipe fallback, but not enough as the primary source for a Korean recipe improvement app.

## Implementation Recommendation

Build the import feature as a confidence-based pipeline:

1. `sourceUrl` and source metadata are always stored.
2. Structured public APIs and Schema.org imports are treated as high confidence.
3. Site parser results are treated as medium confidence.
4. Plain search results and unstructured page text are treated as low confidence.
5. Low-confidence imports require manual correction before save.
6. AI parsing, if added later, creates drafts only.

This keeps the app cheap to operate while avoiding unreliable automatic entry from unstructured search results.
