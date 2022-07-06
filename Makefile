default: help

.PHONY: docker
docker: ## Create a container docker with the app
	docker-compose up --build --remove-orphans --renew-anon-volumes

.PHONY: clean-docker
clean-docker: ## Cleans development environment (Docker containers and volumes).
	docker rm docs_docs_1; exit 0
	docker volume rm docs-tox; exit 0
	docker volume rm docs-venv; exit 0
	rm -rf src/docs/.tox
	rm -rf src/docs/venv

.PHONY: help
help: ## Lists all the available commands.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
