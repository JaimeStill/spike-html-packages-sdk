#!/usr/bin/env bash
# The build: src/ into a fresh dist/. Every source is a handwritten .d.ts, which tsc never emits,
# so src/ is copied as written.
# Adapted from spike-html-packages-foundation (867b4fd): scripts/build.sh, cut to a layer of
# declarations.
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf dist
cp -R src dist
