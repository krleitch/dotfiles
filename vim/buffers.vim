" Buffers

nnoremap <F2> :buffers<Cr>:b<Space>
" next buffer
nnoremap <Leader>f :bn<Cr>
" previous buffer
nnoremap <Leader>b :bp<Cr>
" last used buffer
nnoremap <Leader>g :e#<Cr>
" list buffers
nnoremap <Leader>l :ls<Cr>

" Ngb for N = [1,99] for switching to that buffer
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

" Search for buffers by name with partial matchings
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel) function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")( 
