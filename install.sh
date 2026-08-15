#!/usr/bin/env bash
#
# install.sh — one-command setup for ssk090/pi-extensions-repo
#
# Usage:
#   git clone https://github.com/ssk090/pi-extensions-repo.git
#   cd pi-extensions-repo
#   ./install.sh
#
# What this does:
#   Installs every skill listed in config/skills.sh globally (-g), so
#   they're available in every project/session on this machine.
#
# To add a new skill in future, edit config/skills.sh — see the comments
# in that file. This file (install.sh) shouldn't need to change.
#
# Layout:
#   config/skills.sh        — the list of skills to install (edit this)
#   lib/check_npx.sh         — verifies Node/npx is available
#   lib/install_gh.sh        — installs the gh CLI if missing (macOS/Windows/Linux/WSL)
#   lib/install_skills.sh    — installs everything from config/skills.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/config/skills.sh"
source "$SCRIPT_DIR/lib/check_npx.sh"
source "$SCRIPT_DIR/lib/install_gh.sh"
source "$SCRIPT_DIR/lib/install_skills.sh"

echo "==> Checking prerequisites"
check_npx
ensure_gh_installed

install_project_skills

echo ""
echo "==> Done. All skills above are now available globally in any Pi session."
echo "    - Update a skill later with: npx skills update"
echo "    - Update gh-axi later with: gh-axi update"
