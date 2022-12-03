local opt = vim.opt

-- encoding
opt.encoding = "utf-8"

-- lines
opt.relativenumber = true
opt.number = true
opt.linebreak = true
opt.cursorline = true

-- tabs & indentation
opt.shiftwidth = 2
opt.softtabstop = 2
opt.wrap = true
opt.autoindent = true

-- splitting
opt.splitright = true
opt.splitbelow = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- history
opt.hidden = true
opt.history = 1000
opt.scrolloff = 10

-- appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- misc
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
-- vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.g.netrw_list_hide = ".*.swp$,.*.pyc,.pytest_cache,.mypy_cache,__pycache__,.tags,__tests__"

--python
vim.g.python3_host_prog = "/Users/olzhas/.pyenv/shims/python3"
