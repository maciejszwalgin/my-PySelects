# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A documentation-only MkDocs site: a personal, curated list of Python packages the author recommends, organized by category. There is no importable Python package, no application code, and no test/lint suite — `pyproject.toml` only exists to `pip install -e "."` so the `mkdocs` CLI is available. Do not try to add tests, linting, or type-checking config unless explicitly asked.

## Commands

Use `make` (all commands shell out to `uv`):
- `make install` — set up venv and install deps via uv
- `make serve` — `uv run mkdocs serve` (live preview)
- `make build` — `uv run mkdocs build` (also what CI runs on deploy)
- `make clean` — remove `site/`
- `make deploy` — `uv run mkdocs gh-deploy --force` (do not run without being asked — pushes to `gh-pages`)

Use `uv` for any dependency changes (`uv add <pkg>`), not raw `pip install`.

## Adding a package entry

Each category page in `docs/` (`data-science.md`, `devops.md`, `utils.md`, etc.) follows a fixed template per entry:

```
### [🌟 Package Name](url) - Recommended!

**Why I recommend it:**
- ...

**Key Features:**
- 🚀 ...

**Note:** (optional)

```python
# optional usage example
```
```

Match this structure exactly — heading level, emoji markers, bold section labels — rather than inventing a new format.

- `docs/index.md` includes the root `README.md` verbatim via `{% include-markdown "../README.md" %}` — edit `README.md`, not `index.md`, to change the homepage content.
- `docs/specialized.md` is a work-in-progress page intentionally commented out of the `nav` in `mkdocs.yml`. Leave it unlinked unless told otherwise.

## Gotcha: strict builds

`mkdocs.yml` has `strict: true` — `mkdocs build` (and CI) fails on any warning, including broken internal links or nav entries pointing at missing pages. After editing nav or adding/moving pages, verify with `make build` before considering the change done.

## Commit style

Conventional Commits, lowercase, short: `chore: add tensorflow`, `fix: small fixes`. Solo project on `main` — no feature-branch or PR convention in use.