local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- general
map("n", "<Leader>e", ":NvimTreeToggle<CR>")
map("n", "<Leader>le", ":Lexplore<CR>")
map("v", "<Leader>y", [["+y]])
map("n", "<Leader>y", [["+y]])
map("n", "gx", "<cmd>lua require('core.funcs').handleURL()<CR>")

-- navigation
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

map("n", "∆", ":bp<CR>")
map("n", "˚", ":bn<CR>")
map("n", "<Leader>bd", ":Bd<CR>")

map("n", "<Leader>tn", ":tabnext<CR>")
map("n", "<Leader>tp", ":tabprevious<CR>")

--FZF
map("n", "<C-f>", ":GFiles --cached --others --exclude-standard<CR>")
map("n", "<C-g>", ":GFiles?<CR>")
map("n", "<Leader>f", ":Files<CR>")
map("n", "<Leader>bu", ":Buffers<CR>")
map("n", "<Leader>gf", ":GFiles?<CR>")
map("n", "<Leader>ag", ":Ag<CR>")
map("n", "<Leader>rg", ":Rg<CR>")
map("n", "<C-s>", ":Rg <C-R><C-W><CR>")
map("n", "<Leader>l", ":Lines<CR>")
map("n", "<Leader>h", ":LocalHistory<CR>")

--Trouble
map("n", "<Leader>tr", ":TroubleToggle<CR>")

--Fugitive
map("n", "<Leader>gs", ":vertical Git<CR>")
map("n", "<Leader>gw", ":Gwrite<CR>")
map("n", "<Leader>gp", ":Git push<CR>")
map("n", "<Leader>gb", ":Git branch<CR>")
map("n", "<Leader>df", ":Gdiff<CR>")
map("n", "<Leader>dt", ":Git difftool<CR>")

--Dash
map("n", "<Leader>da", ":Dash<CR>")

--Tests
map("n", "<Leader>rs", [[:exe "!tmux send -t 1.2 './manage.py runserver' Enter"<CR><CR>]], { silent = true })
map("n", "<Leader>T", [[:exe "!tmux send -t 1.3 'ptw . " . bufname("%") . " ' Enter"<CR><CR>]], { silent = true })
