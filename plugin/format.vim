" For all formatting and linitng and quickfix

" prettier
nmap <Leader>p :Neoformat <CR>

" make (eslint, pylint)
" :view $VIMRUNTIME/compiler
" an example of whawt it looks like if the compiler is not supported
" autocmd FileType javascript setlocal makeprg=eslint\ --format\ compact
autocmd FileType python compiler pylint
autocmd FileType javascript compiler eslint
autocmd FileType typescript compiler eslint
nmap <Leader>m :lmake %<CR>
" run make on write
" autocmd BufWritePost *.py,*.js,*.ts,*.tsx silent make! <afile> | silent redraw!

" automatically open quickfix list if there are changes
" autocmd QuickFixCmdPost [^l]* TroubleToggle quickfix

