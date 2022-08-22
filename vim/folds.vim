setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
set fillchars=fold:\ "The backslash escapes a space
set foldtext=CustomFoldText()

function! CustomFoldText()
  let indentation = indent(v:foldstart - 1)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let expansionString = repeat(" ", indentation)

  return expansionString . foldLevelStr . foldSizeStr
endfunction

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! RepeatCmd(cmd) range abort
    let n = v:count < 1 ? 1 : v:count
    while n > 0
        exe a:cmd
        let n -= 1
    endwhile
endfunction

" skip over open folds
nnoremap <silent> <space>zj :<c-u>call RepeatCmd('call NextClosedFold("j")')<cr>
nnoremap <silent> <space>zk :<c-u>call RepeatCmd('call NextClosedFold("k")')<cr>

" go up to the start of the fold
" this is so very hacky and bad if the file is big LMAO
" should save the view and just restore it to go one backwards
" does not work with dot repeat
function! GoToPrevFoldStart(direction)
  let view = winsaveview()
  let end = line('.')
  exe 'norm!gg'
  let start = line('.')
  let counter = 0
  let continue = 1
  let prev = -1
  while (start < end) && (prev != start)
    exe 'norm!zj'
    let prev = start
    let start = line('.')
    let counter = counter + 1
  endwhile
  let jumpsNeeded = counter - 1
  if jumpsNeeded > 0
    exe 'norm!gg'
    exe 'norm!' . jumpsNeeded . 'zj'
  else
    call winrestview(view)
  endif
endfunction
nmap <silent> zb :cal GoToPrevFoldStart("prev")<Cr>

