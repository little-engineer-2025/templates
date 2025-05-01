VERSION=1.0.0

.PHONY: help
help: ## Help tools

.PHONY: all
all: format lint test build ## Run format, lint, test and build

.PHONY: format
format: ## Reformat source code

.PHONY: lint
lint: ## Lint source code

.PHONY: test
test:
	cargo test

.PHONY: build
build:
	cargo build --release

.PHONY: container-build
container-build:
	podman image build -t $(VERSION) -f Dockerfile .
