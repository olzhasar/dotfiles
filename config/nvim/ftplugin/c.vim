setlocal sw=2
setlocal ts=2
setlocal sts=2
setlocal expandtab
setlocal cindent
setlocal colorcolumn=100
setlocal keywordprg=:Man

" Make gf more useful for common C project layouts.
setlocal suffixesadd+=.h
setlocal path+=include,../include,../../include,/usr/local/include,/opt/homebrew/include

" Keep LSP hover on K; use section-specific bindings for C library/syscall docs.
nnoremap <buffer> <Leader>3 :Man 3 <C-r><C-w><CR>
nnoremap <buffer> <Leader>2 :Man 2 <C-r><C-w><CR>
