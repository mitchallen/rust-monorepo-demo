# Default target executed when no arguments are given to make.
default: build

# Sets the Rust toolchain to use. Override by setting RUST_TOOLCHAIN in your environment.
RUST_TOOLCHAIN ?= stable
CARGO = cargo +$(RUST_TOOLCHAIN)

# Project-specific variables
ALPHA_APP = alpha_app
BETA_APP = beta_app

MEMBERS = ${ALPHA_APP} ${BETA_APP}

.PHONY: check-stable-toolchain build test run clean release 

check-stable-toolchain:
	@if ! rustup toolchain list | grep -q stable; then \
		echo "Stable toolchain not found. Installing..."; \
		rustup toolchain install stable; \
	else \
		echo "Stable toolchain already installed."; \
	fi


# Build all projects
build: check-stable-toolchain
	$(CARGO) build

# Test all projects
test:
	$(CARGO) test

# Run a specific project (e.g., make run PROJECT=alpha_app)
run:
	$(CARGO) run -p $(PROJECT)

# Clean up the project
clean:
	$(CARGO) clean

# Release builds (optimized)
release:
	$(CARGO) build --release

# Build alpha_app specifically
build-alpha-app:
	$(CARGO) build -p $(ALPHA_APP)

# Build beta_app specifically
build-beta-app:
	$(CARGO) build -p $(BETA_APP)

# Run with multiple calls for each member (bin package)
run-all: 
	${MAKE} run PROJECT=${ALPHA_APP}
	${MAKE} run PROJECT=${BETA_APP}

# Define a rule to call the run target for each member
run-loop:
	$(foreach val,$(MEMBERS),$(MAKE) run PROJECT="$(val)";)