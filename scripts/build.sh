#!/usr/bin/env bash
# The build: src/ into a fresh dist/. Every source is a handwritten .d.ts, which tsc never emits,
# so each is copied into dist/ as written.
# Adapted from spike-html-packages-foundation (867b4fd): scripts/build.sh, cut to a layer of
# declarations.
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf dist
mkdir dist
(cd src && find . -type f -name '*.d.ts' -print0 | xargs -0 -r cp --parents -t ../dist)
