# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ziraga"

#########################################
############## MY CHANGES ###############
#########################################

### File Aliases ###
alias shconfig="atom ~/.zshrc"

### Commands Aliases ###
alias restartApache="sudo apachectl restart"

### Location Aliases ###
alias root="cd ..."
alias home="~"
alias desk="cd ~/Desktop/"
alias ..="cd ../"
alias ...="cd ../../"
alias remove='rm -rf'
alias removeSvn="find . -type d -name '.svn' -print -exec rm -rf {} \;"
alias restartTerminal='source ~/.zshrc'
alias compressPng='pngquant 256 *.png -v'

alias showFiles="defaults write com.apple.Finder AppleShowAllFiles TRUE | killall Finder"
alias hideFiles="defaults write com.apple.Finder AppleShowAllFiles FALSE | killall Finder"

__git_files () {
    _wanted files expl 'local files' _files
}

### Environment Variables ###

##########################################
############## END CHANGES ###############
##########################################

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew dircycle )

source $ZSH/oh-my-zsh.sh

### EXPORTS
export PATH=/bin:/usr/sbin:/sbin:/usr/local:usr/local/share/npm/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:~/.composer/vendor/bin

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

### Keep 1000 lines of history within the shell and save it to ~/.zsh_history: ####
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

### Use modern completion system ####
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# To Activate syntax Highlight from home-brew
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh