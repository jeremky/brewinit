#!/bin/bash
# shellcheck disable=SC2046 # intentional split: package list passed as multiple arguments

dir=$(dirname "$(realpath "$0")")

# Check that the script runs on macOS
if [[ $(uname -s) != "Darwin" ]]; then
  echo "This script is for macOS only" >&2
  exit 1
fi

# Disable .DS_Store files on network shares
if [[ $(defaults read /Library/Preferences/com.apple.desktopservices DSDontWriteNetworkStores 2>/dev/null) != 1 ]]; then
  sudo defaults write /Library/Preferences/com.apple.desktopservices DSDontWriteNetworkStores -bool true
fi

# Find the Homebrew path for this architecture
if [[ $(uname -m) == "arm64" ]]; then
  BREW_PATH="/opt/homebrew/bin/brew"
else
  BREW_PATH="/usr/local/bin/brew"
fi

# Install Brew
if ! command -v "$BREW_PATH" >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  grep -qF 'brew shellenv' "$HOME/.zprofile" || echo "eval \"\$($BREW_PATH shellenv)\"" >>"$HOME/.zprofile"
  eval "$($BREW_PATH shellenv)"
fi

# Install CLI apps
if [[ -f "$dir/cli.cfg" ]]; then
  brew install $(grep -v -E '^\s*#|^\s*$' "$dir/config/cli.cfg")
fi

# Install macOS apps (cask)
if [[ -f "$dir/apps.cfg" ]]; then
  brew install --cask $(grep -v -E '^\s*#|^\s*$' "$dir/config/apps.cfg")
fi

# Update and clean up
brew update && brew cleanup
