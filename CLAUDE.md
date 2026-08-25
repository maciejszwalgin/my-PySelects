# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A documentation-only Zensical site: a personal, curated list of Python packages the author recommends, organized by category. There is no importable Python package, no application code, and no test/lint suite — `pyproject.toml` only exists to `pip install -e "."` so the `zensical` CLI is available. Do not try to add tests, linting, or type-checking config unless explicitly asked.

## Commands

Use `make` (all commands shell out to `uv`):
- `make install` — set up venv and install deps via uv
- `make serve` — `uv run zensical serve` (live preview)
- `make build` — `uv run zensical build --strict --clean` (also what CI runs on deploy)
- `make clean` — remove `site/`

Deployment is automatic: pushing to `main` triggers `.github/workflows/deploy-docs.yml`, which builds with Zensical and publishes via GitHub's native Pages Actions deployment (`upload-pages-artifact` + `deploy-pages`) — there is no local deploy command or `gh-pages` branch to push to.

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

- `docs/index.md` includes the root `README.md` verbatim via the `pymdownx.snippets` syntax `--8<-- "README.md"` (path resolved relative to the repo root, per `base_path` in `zensical.toml`) — edit `README.md`, not `index.md`, to change the homepage content.
- `docs/specialized.md` is a work-in-progress page intentionally left out of the `nav` list in `zensical.toml`. Leave it unlinked unless told otherwise.

## Gotcha: strict builds

Unlike MkDocs, Zensical's strict mode is a CLI flag, not a persistent config setting — `make build` and CI both pass `--strict --clean` explicitly, failing on any warning including broken internal links. If you invoke `zensical build` or `zensical serve` directly, remember `--strict` isn't on by default.

## Commit style

Conventional Commits, lowercase, short: `chore: add tensorflow`, `fix: small fixes`. Solo project on `main` — no feature-branch or PR convention in use.