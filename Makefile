.PHONY: install clean serve build

install:
	pip install uv
	uv venv
	uv pip install -e "."

clean:
	rm -rf site/

serve:
	uv run zensical serve

build:
	uv run zensical build --strict --clean
