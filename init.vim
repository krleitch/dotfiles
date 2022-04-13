call plug#begin('~/.config/nvim/bundle')


call plug#end()

set runtimepath^=-/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
