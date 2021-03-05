highlight TestOk    ctermfg=Green
highlight TestError ctermfg=Red
highlight TestWarning ctermfg=Yellow

syn match TestOk    "\<PASSED"
syn match TestOk    "\d\+ passed"
syn match TestError "\<FAILED"
syn match TestError "\<FAILURES"
syn match TestError "\w\+Error"
syn match TestError "\w\+Exception"
syn match TestError "\d\+ failed"
syn match Warning   "\d\+ warning"
