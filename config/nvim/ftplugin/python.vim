setlocal sw=4
setlocal ts=4
setlocal sts=4
setlocal tw=90
setlocal autoindent
setlocal expandtab

set backspace=indent,eol,start

setlocal colorcolumn=90

let b:ale_python_isort_use_global = 0
let b:ale_python_isort_executable = ''

let b:ale_fixers = ['isort', 'black']
let b:ale_linters = ['flake8', 'mypy']

let b:ale_python_mypy_ignore_invalid_syntax = 1
let b:ale_python_mypy_options = '--ignore-missing-imports'

if executable("python3")
  nnoremap <silent> <F5> :!python3 %<CR>
endif

nnoremap <leader>B :ALEFix black<CR>
