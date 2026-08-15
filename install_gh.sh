#!/usr/bin/env bash
#
# lib/install_gh.sh — ensure the gh CLI is present (gh-axi needs it).
# If missing, installs it using whatever package manager fits the OS.
# Never hard-fails the overall script — falls back to a manual-install
# message if nothing suitable is found.

ensure_gh_installed() {
  if command -v gh >/dev/null 2>&1; then
    echo "gh CLI found."
    return
  fi

  echo "gh CLI not found — installing it now (gh-axi needs it)."

  case "$OSTYPE" in
    darwin*)
      _install_gh_macos
      ;;
    msys*|cygwin*|win32*)
      _install_gh_windows
      ;;
    linux*)
      # Also covers WSL, which reports as linux-gnu
      _install_gh_linux
      ;;
    *)
      _gh_manual_install_notice "Unrecognized OS ($OSTYPE)."
      ;;
  esac

  if command -v gh >/dev/null 2>&1; then
    echo "gh installed. Run 'gh auth login' if you haven't authenticated yet."
    echo "(Windows/Git Bash: you may need to restart your terminal for gh to be found on PATH.)"
  fi
}

_install_gh_macos() {
  if command -v brew >/dev/null 2>&1; then
    brew install gh
  else
    _gh_manual_install_notice "Homebrew not found. Install it from https://brew.sh, then run: brew install gh"
  fi
}

_install_gh_windows() {
  if command -v winget >/dev/null 2>&1; then
    winget install --id GitHub.cli --silent --accept-package-agreements --accept-source-agreements
  elif command -v choco >/dev/null 2>&1; then
    choco install gh -y
  else
    _gh_manual_install_notice "Neither winget nor choco found."
  fi
}

_install_gh_linux() {
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y gh
  else
    _gh_manual_install_notice "apt-get not found."
  fi
}

_gh_manual_install_notice() {
  echo "$1 Install gh manually from https://cli.github.com/"
  echo "Continuing without gh — gh-axi will be installed but won't work until gh is set up."
}
