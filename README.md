# dotfiles

## create soft links

- ln -s ~/dotfiles/.vimrc ~/.vimrc
- ln -s ~/dotfiles/init.vim ~/.config/nvim
- ln -s ~/dotfiles/plugin/ ~/.config/nvim/after/
- any other configs you have

## monokai-phoenix for vim

https://github.com/Reewr/vim-monokai-phoenix

add to .vim/colors
add to .config/nvim/colors

## source .bashrc from .bash_profile

if [ -r ~/.bashrc ]; then

source ~/.bashrc

fi

## PS1 Generator

http://bashrcgenerator.com/

## Tmux

- https://github.com/wfxr/tmux-power

## Neovim Setup

- Philosophy: https://github.com/romainl/idiomatic-vimrc

### Fonts

- https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack
- https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/RobotoMono

### nvim-lspconfig

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- call setup on each lsp config
- npm install -g typescript typescript-language-server
- install the lsp for everything you setup

Angular Notes:

- install typescript and angular-language-server as dev dependencies in the project

### Diagnostics

- npm install -g diagnostic-languageserver
- npm install -g eslint_d prettier

### Treesitter

- https://github.com/nvim-treesitter/nvim-treesitter
- npm install -g tree-sitter-cli
- :TSInstall javascript
- :TSInstallInfo
- Install any other languages you want syntax for
