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
#   Installs everything in PROJECT_SKILLS globally (-g), so it's available
#   in every project/session on this machine — installed once per machine.
#
# To add a new skill in future: add one line to the PROJECT_SKILLS array
# below, commit, and push. See the "Adding new skills" note at the bottom
# of this file for the full workflow.
#
# Requires: node/npx, and gh (https://cli.github.com/) authenticated via `gh auth login`

set -euo pipefail

# ── Skill list — edit this when you install something new ──────────────────
#
# One line per skill: full GitHub URL of the repo it lives in.
# Each repo is installed in full (every skill it contains).
#
# Note: bash arrays use () with space-separated items, not [] with commas —
# this is the bash equivalent of PROJECT_SKILLS = [ "...", "...", ... ]
PROJECT_SKILLS=(
  "https://github.com/kunchenguid/gh-axi"
  "https://github.com/anthropics/skills"
  "https://github.com/vercel-labs/skills"
  "https://github.com/mattpocock/skills"
  # Example — to add:  npx skills add https://github.com/vercel-labs/agent-skills -g
  # just append here:  "https://github.com/vercel-labs/agent-skills"
)

# ── Installer — shouldn't need to touch below this line ────────────────────

echo "==> Checking prerequisites"
command -v npx >/dev/null 2>&1 || { echo "npx not found. Install Node.js first."; exit 1; }
command -v gh  >/dev/null 2>&1 || echo "Warning: gh CLI not found — gh-axi needs it. Install from https://cli.github.com/"

echo ""
echo "==> Installing skills globally (available in every project/session)"
for repo in "${PROJECT_SKILLS[@]}"; do
  echo "    - $repo -g"
  npx skills add "$repo" -g
done

echo ""
echo "==> Done. All skills above are now available globally in any Pi session."
echo "    - Update a skill later with: npx skills update"
echo "    - Update gh-axi later with: gh-axi update"

# ── Adding new skills in future ─────────────────────────────────────────────
#
# 1. Install the skill as you normally would, e.g.:
#      npx skills add <full-github-url> -g
#
# 2. Add the same URL to the PROJECT_SKILLS array above.
#
# 3. Commit and push:
#      git add install.sh
#      git commit -m "Add <repo-name> to install script"
#      git push
#
# Now any machine that clones the repo and runs ./install.sh gets it too.
#
# Note: if a repo has multiple skills and you only want ONE of them
# (not the whole repo), install it with --skill <name> instead, and
# add a comment next to that line in PROJECT_SKILLS noting it's a partial
# install so future-you remembers to run it manually rather than via the loop.
