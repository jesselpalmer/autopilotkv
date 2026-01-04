GO ?= go

BIN_DIR := bin

.PHONY: help tidy fmt vet test build clean

help:
	@echo "Targets:"
	@echo "  make tidy		- ensure go.mod/go.sum match imports (go mod tidy)"
	@echo "  make test		- run tests (go tests ./...)"

# Update module dependencies: add missing deps and removes unused ones
tidy:
	$(GO) mod tidy

# Run all tests
test:
	$(GO) test ./...
