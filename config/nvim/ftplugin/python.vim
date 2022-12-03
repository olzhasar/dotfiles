setlocal sw=4
setlocal ts=4
setlocal sts=4
setlocal tw=90
setlocal autoindent
setlocal expandtab

set backspace=indent,eol,start

setlocal colorcolumn=90

if executable("python3")
  nnoremap <silent> <F5> :!python3 %<CR>
endif
