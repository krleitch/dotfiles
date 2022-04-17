# dotfiles

### create soft links

- ln -s ~/dotfiles/.vimrc ~/.vimrc
- ln -s ~/dotfiles/init.vim ~/.config/nvim
- - any other configs you have

### monokai-phoenix

https://github.com/Reewr/vim-monokai-phoenix

add to .vim/colors
add to .config/nvim/colors

### source .bashrc from .bash_profile

if [ -r ~/.bashrc ]; then

source ~/.bashrc

fi

### PS1 Generator

http://bashrcgenerator.com/

### Neovim Setup

Inspiration: https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887

#### Fonts

- https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack
- Make sure you have the patched Mono version

#### nvim-lspconfig

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- call setup on each lsp config
- npm install -g typescript typescript-language-server
- install the lsp for everything you setup

#### Diagnostics

- npm install -g diagnostic-languageserver
- npm install -g eslint_d prettier

#### Coq

- https://github.com/ms-jpq/coq_nvim
- requires sqlite3, python 3.8.2, python3-venv

#### Treesitter

- https://github.com/nvim-treesitter/nvim-treesitter
- :TSInstall javascript
- :TSInstallInfo
- Install any other languages you want syntax for
