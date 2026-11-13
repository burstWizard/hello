#!/usr/bin/env bash

set -euo pipefail

git clone https://github.com/burstWizard/hello.git
cd hello
cargo build --release --locked

cp target/release/hello /output/

