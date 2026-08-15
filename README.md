# Pi Extensions Repository

A collection of setup scripts for installing a shared set of agent skills globally, so they are available in every [Pi](https://github.com/badlogic/pi-mono) session.

## Available skills

All skill collections currently available through this repository are listed below. The source configuration is maintained in [`skills.sh`](./skills.sh).

| Skill collection | Source | Description |
| --- | --- | --- |
| `gh-axi` | [`kunchenguid/gh-axi`](https://github.com/kunchenguid/gh-axi) | Tools for working with GitHub issues, pull requests, Actions, releases, projects, and other GitHub resources |
| Anthropic skills | [`anthropics/skills`](https://github.com/anthropics/skills) | Anthropic's collection of reusable agent skills |
| Vercel Labs skills | [`vercel-labs/skills`](https://github.com/vercel-labs/skills) | Agent skills maintained by Vercel Labs |
| Matt Pocock skills | [`mattpocock/skills`](https://github.com/mattpocock/skills) | TypeScript and development-focused agent skills |

Each collection is installed globally with `npx skills add <repository> -g`, including every skill exposed by that repository.

## Prerequisites

- Bash
- [Node.js](https://nodejs.org/) and `npx`
- Git

The installer also checks for the [GitHub CLI](https://cli.github.com/), which is required by `gh-axi`. If it is missing, the setup scripts can install it through Homebrew on macOS, `winget` or Chocolatey on Windows, or `apt` on Debian-based Linux systems.

## Installation

Clone the repository:

```bash
git clone https://github.com/ssk090/pi-extensions-repo.git
cd pi-extensions-repo
```

Install the configured skills manually:

```bash
source ./skills.sh
for repo in "${PROJECT_SKILLS[@]}"; do
  npx skills add "$repo" -g
done
```

> **Note:** `install.sh` currently expects the helper scripts under `config/` and `lib/`, while they are stored at the repository root. Until that layout is corrected, use the manual installation command above.

If you use `gh-axi`, authenticate the GitHub CLI afterward:

```bash
gh auth login
```

## Updating skills

Update installed skills with:

```bash
npx skills update
```

Update `gh-axi` with:

```bash
gh-axi update
```

## Adding a skill

1. Add the skill repository URL to the `PROJECT_SKILLS` array in [`skills.sh`](./skills.sh).
2. Run the installation loop again.
3. Commit the updated configuration.

If a repository contains multiple skills and you only need one, install it separately with:

```bash
npx skills add <repository-url> -g --skill <skill-name>
```

## Script overview

| File | Purpose |
| --- | --- |
| [`install.sh`](./install.sh) | Coordinates prerequisite checks and skill installation |
| [`skills.sh`](./skills.sh) | Defines the skill repositories to install |
| [`check_npx.sh`](./check_npx.sh) | Verifies that `npx` is available |
| [`install_gh.sh`](./install_gh.sh) | Checks for and attempts to install the GitHub CLI |
| [`install_skills.sh`](./install_skills.sh) | Installs every configured skill globally |
