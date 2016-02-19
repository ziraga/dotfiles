#!/usr/bin/env bash
set -x

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# TODO: install git here.

# Search local dotfiles
DOT_FILES=$(find ./dotfiles-common -maxdepth 1 \
        -not -path "./dotfiles-common" \
        -not -name "\.DS_Store" -and \
        -not -name "*\.swp" -and \
        -not -name "*~*" )

for FILEPATH in $DOT_FILES
do
    SOURCE="${PWD}/$FILEPATH"
    TARGET="${HOME}/$(basename "${FILEPATH}")"
    if [ "$1" = "restore" ]; then
        # Restore backups if found
        if [ -e "${TARGET}.dotfiles.bak" ] && [ -L "${TARGET}" ]; then
            unlink "${TARGET}"
            mv "$TARGET.dotfiles.bak" "$TARGET"
        fi
    else
        # Link files
        if [ -e "${TARGET}" ] && [ ! -L "${TARGET}" ]; then
            mv "$TARGET" "$TARGET.dotfiles.bak"
        fi
        ln -sf "${SOURCE}" "$(dirname "${TARGET}")"
    fi
done

# Install all software first.
source ./scripts/osx-install.sh

# Configure everything.
source ./scripts/osx-config.sh

# Reload Bash with new configuration
source ~/.bash_profile
