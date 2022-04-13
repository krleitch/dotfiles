# dotfiles

### create soft links
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/init.vim ~/.config/nvim

### get monokai-phoenix
https://github.com/Reewr/vim-monokai-phoenix

add to .vim/colors
add to .config/nvim/colors

### source .bashrc from .bash_profile
if [ -r ~/.bashrc ]; then

   source ~/.bashrc
   
fi

http://bashrcgenerator.com/
