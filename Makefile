default: help

.PHONY: venv
venv: ## Creates a virtual environment.
	python3 -m venv venv

.PHONY: requirements
requirements: ## Builds or updates requirements.
	venv/bin/pip install --upgrade pip wheel setuptools pip-tools
	venv/bin/pip-compile --upgrade requirements.in

.PHONY: install
install: ## Installs dependencies.
	venv/bin/pip install --upgrade pip wheel setuptools
	venv/bin/pip install -r requirements.txt

.PHONY: tests
tests: ## Runs all tests.
	venv/bin/tox

.PHONY: build
build: ## Build the package
	venv/bin/python -m build

.PHONY: push-test
push-test: ## Push dist on test PyPi
	venv/bin/python -m twine upload --repository testpypi dist/*

.PHONY: push-prod
push-prod: ## Push dist on prod PyPi
	venv/bin/python -m twine upload dist/*

.PHONY: docker
docker: ## Create a container docker with the app
	docker-compose up --build --remove-orphans --renew-anon-volumes

.PHONY: help
help: ## Lists all the available commands.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'