let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" open up the wiki in a float term cause it feels nice
nnoremap <leader>wt <cmd>FloatermNew nvim -c ':VimwikiIndex'<cr>
