local opt = vim.opt
local o = vim.o

-- general
opt.hidden = true
opt.autoread = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.spell = true
opt.spelllang = { "en" }

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
opt.smartindent = false

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
opt.signcolumn = "yes"
opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" }

-- filetypes
vim.g.c_syntax_for_h = 1

-- backspace
opt.backspace = "indent,eol,start"

o.statusline = table.concat({
  "%y",
  " %f ",
  " %{get(b:,'gitsigns_status', '')}",
  " %=",
  "%{get(g:, 'gitsigns_head', '')} ",
  "%p%% | ",
  "%l:%c ",
})
--
-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_fastbrowse = 0
vim.g.netrw_altfile = 1
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.g.netrw_list_hide = "^\\./$,.*\\.swp$,.*\\.pyc,.*\\.o$,\\.pytest_cache,\\.mypy_cache,\\.ruff_cache,__pycache__,"
  .. "node_modules,\\.*.sqlite,celerybeat-schedule$"

--python
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/.venv/bin/python3")
