#!/usr/bin/env bash

set -euo pipefail

# Install Git, curl, and the linker Rust needs on Ubuntu.
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential ca-certificates curl git

# Install Rust and Cargo for the current user.
curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs \
    | sh -s -- -y --profile minimal --default-toolchain stable
export PATH="${CARGO_HOME:-$HOME/.cargo}/bin:$PATH"

git clone https://github.com/burstWizard/hello.git
cd hello

cargo build --release --locked --target x86_64-unknown-linux-gnu

sudo mkdir -p /output
sudo install -m 0755 target/x86_64-unknown-linux-gnu/release/hello /output/hello