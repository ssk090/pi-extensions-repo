#!/usr/bin/env bash
#
# lib/install_skills.sh — install every skill listed in
# config/skills.sh (PROJECT_SKILLS), globally (-g).

install_project_skills() {
  echo ""
  echo "==> Installing skills globally (available in every project/session)"
  for repo in "${PROJECT_SKILLS[@]}"; do
    echo "    - $repo -g"
    npx skills add "$repo" -g
  done
}
