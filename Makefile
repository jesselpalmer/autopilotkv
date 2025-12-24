GO ?= go

BIN_DIR := bin

.PHONY: help tidy fmt vet test build clean

help:
	@echo "Targets:"
	@echo "  make tidy		- ensure go.mod/go.sum match imports (go mod tidy)"

tidy:
	$(GO) mod tidy
