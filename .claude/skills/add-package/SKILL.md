---
name: add-package
description: Scaffold a new Python package entry into the correct docs/*.md category page, following this repo's established entry template. Use when the user asks to add, document, or recommend a new package.
---

Add a new package entry to this MkDocs-based package-recommendation site.

## Steps

1. Determine the right category page in `docs/`: `development-tools.md`, `data-science.md`, `admin-and-frameworks.md`, `databases.md`, `devops.md`, `utils.md`, or `specialized.md` (WIP, unlinked from nav — only use if the user explicitly wants it there). If none fit, ask the user which category, or whether a new one is needed (a new category also requires adding it to `nav:` in `mkdocs.yml`).
2. Find the right subsection heading (`##`) within that page — pages are split into subsections (e.g. `data-science.md` has `## Data Analysis`, `## Machine Learning`, etc). Match the existing entry under a fitting subsection, or ask if unclear.
3. Insert a new entry using this exact structure (matches the existing entries in that file):

```markdown
### [Package Name](https://homepage-or-repo-url)

**Why I recommend it:**

- Reason one
- Reason two
- ...

**Key Features:**

- 🚀 Feature one
- 📈 Feature two
- ...

**Quick Example:**
```python
# minimal, realistic usage example
```
```

- Only add `- Recommended!` to the heading and a 🌟 prefix on the package name (e.g. `### [🌟 Package Name](url) - Recommended!`) for standout picks — most entries are plain `### [Package Name](url)`. Ask the user if this one should be a standout pick, don't assume.
- `**Note:**` is optional — add only if there's a genuinely useful caveat or comparison (e.g. "consider X instead for Y").
- Pick feature emoji that fit the feature described (🚀 speed, 📈 analysis, 📊 data, 🔄 transform, 🔍 search, 🛠️ tooling, 📦 packaging, 🤖 ML) — look at neighboring entries in the same file for consistency rather than reusing the same emoji for everything.
- Write "Why I recommend it" and "Key Features" from your own knowledge of the package; ask the user for specifics if you're not confident about accuracy.

4. After editing, run `make build` (or let the strict-build hook do it) to confirm no broken links or MkDocs warnings were introduced.