let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

nnoremap <leader>wt <cmd>FloatermNew! nvim -c ':VimwikiIndex'<cr>
