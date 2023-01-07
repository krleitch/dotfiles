" Remaps

inoremap jj <ESC>

" multi line alts as default
nnoremap j gj
nnoremap k gk

" Insert mode go to end and start
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Make Y work like D and C instead of just being yy
map Y y$

" re-source vim without restarting
nnoremap <leader>sv :source $MYVIMRC<CR>

" run through camelCase characters better
" generally use sneak or f/t for this in singlue use. use meta in rare case
nnoremap <silent><M-b> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><M-w> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><M-b> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><M-w> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" add a new line above or below without leaving insert mode with repeat
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" use [[ ]] ][ [] when not in first column
map [[ :silent! eval search('{', 'b')<CR>w99[{
map ][ :silent! eval search('}')<CR>b99]}
map ]] j0[[%:silent! eval search('{')<CR>
map [] k$][%:silent! eval search('}', 'b')<CR>

" jump to the previous function
nnoremap <silent> [f :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]f :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>

" clear highlighting
nnoremap <space><space> :noh<CR>

" Allow saving of files as sudo when I forget to start vim using sudo
" doesnt work in neovim
cmap w!! w !sudo tee > /dev/null %

" macro over visual range
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" quick norm modes
vnoremap <space>n :'<,'>norm
