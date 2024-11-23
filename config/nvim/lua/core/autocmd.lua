local api = vim.api
local au_group = api.nvim_create_augroup("user_defined_commands", { clear = true })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = au_group,
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.conf", "*.cnf", "*.cfg", "*.ini", "*.dosini" },
  command = ":setfiletype dosini",
  group = au_group,
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.nginx.conf" },
  command = ":setfiletype nginx",
  group = au_group,
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.jinja", "*.j2", "*.jinja2", "*.jinja.html", "**/templates/**/*.html" },
  command = ":setfiletype htmldjango",
  group = au_group,
})

api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  command = "silent! call mkdir(fnamemodify(expand('<afile>'), ':p:h'), 'p')",
  group = au_group,
})
