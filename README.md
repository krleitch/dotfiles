# dotfiles

## Create soft links

- ln -s ~/dotfiles/.vimrc ~/.vimrc
- ln -s ~/dotfiles/init.vim ~/.config/nvim
- ln -s ~/dotfiles/plugin/ ~/.config/nvim/after/
- any other configs you have

## Colors

vim - https://github.com/Reewr/vim-monokai-phoenix
neovim - https://github.com/krleitch/nvim-lychee

add to .vim/colors

## source .bashrc from .bash_profile

```
if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi
```

## PS1 Generator

http://bashrcgenerator.com/

## Tmux

- https://github.com/tmux-plugins/tmux-cpu
- https://github.com/tmux-plugins/tmux-battery

## Neovim Setup

- Philosophy: https://github.com/romainl/idiomatic-vimrc
- Useful Gists: https://gist.github.com/romainl/4b9f139d2a8694612b924322de1025ce

### Fonts

- Hack: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack
- RobotoMono: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/RobotoMono
- Kitty
  - Don't use a patched font, use symbol_map with the following fonts installed
  - Nonicons: https://github.com/yamatsum/nonicons
  - Symbols Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases 


### nvim-lspconfig

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- call setup on each lsp config
- install the lsp for everything you setup
- ex. npm install -g typescript typescript-language-server

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
