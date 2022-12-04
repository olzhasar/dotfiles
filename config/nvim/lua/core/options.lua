local opt = vim.opt
local o = vim.o

-- general
opt.hidden = true
opt.encoding = "utf-8"
opt.autoread = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

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
opt.smartindent = true

-- splitting
opt.splitright = true
opt.splitbelow = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- history
opt.history = 1000
opt.scrolloff = 10

-- appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

o.statusline = ""
o.statusline = o.statusline .. "%y"
o.statusline = o.statusline .. " %f "
o.statusline = o.statusline .. " %{get(b:,'gitsigns_status', '')}"
o.statusline = o.statusline .. " %="
o.statusline = o.statusline .. "%{get(g:, 'gitsigns_head', '')} "
o.statusline = o.statusline .. "%p%% | "
o.statusline = o.statusline .. "%l:%c "

--python
vim.g.python3_host_prog = "/Users/olzhas/.pyenv/shims/python3"
