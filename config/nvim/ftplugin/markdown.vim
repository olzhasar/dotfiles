setlocal spell

let b:ale_lint_on_enter = 1
let b:ale_linters = ['proselint', 'writegood']
let b:ale_fixers = ['remark-lint']
let b:ale_writegood_options = "--no-passive"
