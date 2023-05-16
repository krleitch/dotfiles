# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Alias commands
alias q="exit"
alias c="clear"
alias nv="nvim"

# Only alias things that you know wont be overwritten by plugins here

# Alias Directories
alias repos="cd ~/Documents/repos"
alias dev="cd ~/Documents/dev"
alias notes="cd ~/Documents/notes"
alias down="cd ~/Downloads"
alias dot="cd ~/dotfiles"

# Alias Current project
alias spot="cd ~/Documents/repos/spot"
alias sweb="cd ~/Documents/repos/spot/spot-web"
alias sapi="cd ~/Documents/repos/spot/spot-server"
alias scom="cd ~/Documents/repos/spot/spot-commons"
alias smob="cd ~/Documents/repos/spot-mobile"
alias scha="cd ~/Documents/repos/spot-chat"
alias slam="cd ~/Documents/repos/spot-lambda"

# PATH
export PATH=~/Documents/dev/sqlite:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH
# neovim from source
# export PATH=~/Documents/dev/neovim/build/bin:$PATH
# neovim release
export PATH=~/Documents/dev/nvim-macos/bin:$PATH
export PATH=~/Documents/dev/logo-ls:$PATH
export PATH=~/Documents/dev/rust:$PATH

# spot
export API_DATABASE_URL="postgresql://postgres:root@localhost:5432/spot"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Android SDK
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Update ruby to use rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# tweak the highlights for syntax-highlighting
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=161,bold #red
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=155 #green
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[precommand]=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=none
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=152 #cyan
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=208 #orange
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=208 #orange
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=152 #cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=152 #cyan
ZSH_HIGHLIGHT_STYLES[assign]=none

# User configuration

# accept auto suggestion with ctrl + space
bindkey '^ ' autosuggest-accept

# show images in kitty
alias icat="kitty +kitten icat"

# use logo-ls
alias ls="logo-ls"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
