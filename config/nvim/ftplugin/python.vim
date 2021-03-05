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

let b:ale_linters = ['flake8', 'mypy']
let b:ale_fixers = ['isort']

let b:ale_python_mypy_ignore_invalid_syntax = 1
let b:ale_python_mypy_options = '--ignore-missing-imports'
