setlocal sw=4
setlocal ts=4
setlocal sts=4
setlocal tw=90
setlocal expandtab

setlocal colorcolumn=90

if executable("python3")
  nnoremap <silent> <F5> :!python3 %<CR>
endif
