#!/usr/bin/env bash
#
# lib/check_npx.sh — verify Node/npx is available. Hard requirement,
# so this exits the whole script if missing.

check_npx() {
  if ! command -v npx >/dev/null 2>&1; then
    echo "npx not found. Install Node.js first: https://nodejs.org"
    exit 1
  fi
}
