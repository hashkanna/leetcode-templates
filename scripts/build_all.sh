#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export TEXMFCACHE="$ROOT_DIR/build/texcache"
export HOME="$ROOT_DIR"

mkdir -p "$ROOT_DIR/pdf"

for topic_dir in "$ROOT_DIR"/templates/*; do
  if [[ ! -d "$topic_dir" ]]; then
    continue
  fi
  topic_name="$(basename "$topic_dir")"
  mkdir -p "$ROOT_DIR/build/$topic_name"
  shopt -s nullglob
  for tex_file in "$topic_dir"/*.tex; do
    job_name="$(basename "${tex_file%.tex}")"
    mkdir -p "$ROOT_DIR/build/$topic_name/_minted-$job_name"
    latexmk -lualatex -shell-escape \
      -outdir="$ROOT_DIR/pdf" \
      -auxdir="$ROOT_DIR/build/$topic_name" \
      "$tex_file"
  done
  shopt -u nullglob
done
