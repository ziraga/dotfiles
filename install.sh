#!/usr/bin/env bash
set -x

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Install all software first.
source ./scripts/osx-install.sh

# Configure everything.
source ./scripts/osx-config.sh

# Reload Bash with new configuration
source ~/.bash_profile
