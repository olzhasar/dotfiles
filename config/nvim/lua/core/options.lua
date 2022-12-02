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
opt.history=1000
opt.scrolloff=10

-- appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"
