generate: ## Regenerate the README from various sources
	@echo "--- Generating data.yml from GitHub Topics..."
	@bin/topics2data
	@echo "--- Generating data.yml from spec.json file via GitHub Search..."
	@bin/search2data
	@echo "--- Generating README from data.yml..."
	@bin/data2readme

travis-update: ## Commit and push changes to GitHub (eg. from TravisCI)
	@bin/push-to-github

# Boilerplate for pretty makefile help.
# Ref: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

%:
	@true

.PHONY: help

help:
	@echo 'Usage: make <command>'
	@echo
	@echo 'where <command> is one of the following:'
	@echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
