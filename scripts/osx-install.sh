#!/usr/bin/env bash
set -x

# We need to distinguish sources and binary packages for Brew & Cask on OSX
COMMON_PACKAGES="git-extras git openssl subversion zsh gdbm git-flow jpeg nvm zsh-syntax-highlighting"
BIN_PACKAGES="xtrafinder vlc google-drive quicksilver smcfancontrol splashtop-personal splashtop-streamer intellij-idea vagrant vagrant-manager virtualbox kaleidoscope atom fenix firefox google-chrome gitup iterm2 betterzipql epubquicklook qlcolorcode qlmarkdown qlstephen quicklook-json webpquicklook openssh"

# Install command line tools
xcode-select -p
if [[ $? -ne 0 ]]; then
    xcode-select --install
fi

# A full installation of Xcode.app is required to compile some formulas like
# macvim. Installing the Command Line Tools only is not enough.
# Also, if Xcode is installed but the license is not accepted then brew will
# fail.
xcodebuild -version
# Accept Xcode license
if [[ $? -ne 0 ]]; then
    # TODO: find a way to install Xcode.app automatticaly
    # See: http://stackoverflow.com/a/18244349
    sudo xcodebuild -license
fi

# Update all OSX packages
sudo softwareupdate -i -a

# Istall oh-my-zshell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Set zsh as default shell
chsh -s $(which zsh)


# Install Homebrew if not found
brew --version 2>&1 >/dev/null
if [[ $? -ne 0 ]]; then
    # Clean-up failed Homebrew install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade --all
# Include duplicates packages
brew tap homebrew/dupes
# Install or upgrade Cask
brew tap caskroom/cask

# Install non-binary apps
for PACKAGE in $COMMON_PACKAGES
do
   brew install "$PACKAGE"
done

# htop-osx requires root privileges to correctly display all running processes.
sudo chown root:wheel "$(brew --prefix)/bin/htop"
sudo chmod u+s "$(brew --prefix)/bin/htop"

# Install binary apps
for PACKAGE in $BIN_PACKAGES
do
   brew cask install --force "$PACKAGE"
done

qlmanage -r


# Install uBlock for Safari.
defaults read ~/Library/Safari/Extensions/extensions | grep --quiet "net.gorhill.uBlock"
if [[ $? -ne 0 ]]; then
    curl -o "$TMPDIR/ublock-safari.safariextz" -O https://cloud.delosent.com/ublock-safari-0.9.5.2.safariextz
    open "$TMPDIR/ublock-safari.safariextz"
fi

# Clean things up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
