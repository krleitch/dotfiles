" open up the wiki in a float term cause it feels nice
nnoremap <leader>wt <cmd>FloatermNew --height=0.75 --width=0.85 --cwd=~/vimwiki nvim -c ':VimwikiIndex'<cr>
nnoremap <leader>wd <cmd>FloatermNew --height=0.75 --width=0.85 --cwd=~/vimwiki nvim -c ':VimwikiMakeDiaryNote'<cr>
" go to last session of the wiki
nnoremap <leader>ws <cmd>FloatermNew --height=0.75 --width=0.85 --cwd=~/vimwiki nvim -c ':RestoreSession'<cr><cr>

:hi VimwikiHeader1 guifg=#e57373
:hi VimwikiHeader2 guifg=#b2dfdb
:hi VimwikiHeader3 guifg=#c5e1a5
:hi VimwikiHeader4 guifg=#ffcdd2
:hi VimwikiHeader5 guifg=#ce9178
:hi VimwikiHeader6 guifg=#d6b9a8

let g:vimwiki_global_ext = 0
