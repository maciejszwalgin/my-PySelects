.PHONY: install clean serve build deploy

install:
	pip install uv
	uv venv
	uv pip install -e "."

clean:
	rm -rf site/

serve:
	uv run mkdocs serve

build:
	uv run mkdocs build

deploy:
	uv run mkdocs gh-deploy --force
