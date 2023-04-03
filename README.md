# dotfiles

## Create soft links

- ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
- ln -s ~/dotfiles/snippets ~/.config/nvim/lua
- ln -s ~/dotfiles/.zshrc ~/.zshrc
- ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
- ln -s ~/dotfiles/.bashrc ~/.bashrc
- ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
- ln -s ~/dotfiles/.gitconfig ~/.gitconfig
- ln -s ~/dotfiles/.kitty.conf ~/.kitty.conf

### source .bashrc from .bash_profile

```bash
if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi
```

- PS1 - http://bashrcgenerator.com/

## Colors

- vim - https://github.com/Reewr/vim-monokai-phoenix
  - add to .vim/colors
- neovim - https://github.com/krleitch/nvim-lychee

## Tmux

- https://github.com/tmux-plugins/tmux-cpu
- https://github.com/tmux-plugins/tmux-battery
- https://github.com/robhurring/tmux-uptime

## Neovim

- Philosophy: https://github.com/romainl/idiomatic-vimrc
- Useful Gists: https://gist.github.com/romainl/4b9f139d2a8694612b924322de1025ce

## Fonts

- Hack: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack
- RobotoMono: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/RobotoMono
- Kitty
  - Don't use a patched font, use symbol_map with the following fonts installed
  - Nonicons: https://github.com/yamatsum/nonicons
  - Symbols Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases
