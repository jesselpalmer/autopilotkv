GO ?= go

BIN_DIR := bin

.PHONY: help tidy fmt vet test build clean

help:
	@echo "Targets:"
	@echo "  make mod       - ensure go.mod/go.sum match imports (go mod tidy)"
	@echo "  make format    - format code (go fmt ./...)"
	@echo "  make vet       - run vet checks (go vet ./...)"
	@echo "  make test      - run tests (go tests ./...)"
	@echo "  make build     - build binaries into ./$(BIN_DIR) (autopilotkvd, apkv, apkvctl)"
	@echo "  make clean     - clean up build artifacts"

# Update module dependencies: add missing deps and removes unused ones
tidy:
	$(GO) mod tidy

# Formats all of the code in the project
fmt:
	$(GO) fmt ./...

# Run all tests
test:
	$(GO) test ./...

# Build all the binaries
build:
	mkdir -p $(BIN_DIR)
	$(GO) build -o $(BIN_DIR)/autopilotkvd ./cmd/autopilotkvd
	$(GO) build -o $(BIN_DIR)/apkv ./cmd/apkv
	$(GO) build -o $(BIN_DIR)/apkvctl ./cmd/apkvctl

# Clean up build artifacts
clean:
	rm -rf $(BIN_DIR)
