#!/usr/bin/env bash
#
# config/skills.sh — the list of skills to install globally.
#
# One line per skill: full GitHub URL of the repo it lives in.
# Each repo is installed in full (every skill it contains).
#
# To add a new skill:
#   1. Install it as you normally would: npx skills add <full-github-url> -g
#   2. Append the same URL to this array.
#   3. Commit and push. Done — any machine that runs install.sh gets it too.
#
# Note: if a repo has multiple skills and you only want ONE of them
# (not the whole repo), install it manually with --skill <name> instead,
# and leave a comment here rather than adding it to this array.

PROJECT_SKILLS=(
  "https://github.com/kunchenguid/gh-axi"
  "https://github.com/anthropics/skills"
  "https://github.com/vercel-labs/skills"
  "https://github.com/mattpocock/skills"
  # Example — to add:  npx skills add https://github.com/vercel-labs/agent-skills -g
  # just append here:  "https://github.com/vercel-labs/agent-skills"
)
