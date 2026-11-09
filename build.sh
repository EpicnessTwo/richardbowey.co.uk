#!/usr/bin/env bash

set -euo pipefail

HUGO_VERSION=0.167.0
NODE_VERSION=24.22.1
export TZ=Etc/UTC
export HUGO_CACHEDIR="${PWD}/.cache/hugo"

build_temp_dir=$(mktemp -d)
trap 'rm -rf "$build_temp_dir"' EXIT

mkdir -p "$HOME/.local/hugo" "$HOME/.local"

curl -fsSL -o "$build_temp_dir/hugo.tar.gz" \
  "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
tar -C "$HOME/.local/hugo" -xzf "$build_temp_dir/hugo.tar.gz"
export PATH="$HOME/.local/hugo:$PATH"

curl -fsSL -o "$build_temp_dir/node.tar.gz" \
  "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz"
tar -C "$HOME/.local" -xzf "$build_temp_dir/node.tar.gz"
export PATH="$HOME/.local/node-v${NODE_VERSION}-linux-x64/bin:$PATH"

npm ci
hugo --minify
