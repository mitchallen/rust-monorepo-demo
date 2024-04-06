# Default target executed when no arguments are given to make.
default: build

# Sets the Rust toolchain to use. Override by setting RUST_TOOLCHAIN in your environment.
RUST_TOOLCHAIN ?= stable
CARGO = cargo +$(RUST_TOOLCHAIN)

# Project-specific variables
ALPHA_APP = alpha_app
BETA_APP = beta_app

.PHONY: build test run clean release build-alpha_app build-beta_app

# Build all projects
build: 
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