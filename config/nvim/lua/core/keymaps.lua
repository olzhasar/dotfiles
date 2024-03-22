local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- General
map("n", "<Leader>e", ":Explore<CR>")
map("n", ",e", [[:e <C-R>=expand("%:h") . "/" <CR>]])
map("n", ",s", [[:split <C-R>=expand("%:h") . "/" <CR>]])
map("n", ",v", [[:vsplit <C-R>=expand("%:h") . "/" <CR>]])
map("n", "Q", "<nop>")
map("n", "<Leader>u", ":UndotreeToggle<CR>")
map("n", "<Leader>bg", ":BackgroundSwitch<CR>")
map("n", "<leader>a", "<cmd>lua require('lspimport').import()<CR>", { noremap = true })
map("n", "<leader>lr", ":LspRestart<CR>")

-- Copy pasting
map("v", "<Leader>y", [["+y]]) -- copy to system clipboard
map("n", "<Leader>y", [["+y]])
map("n", "<Leader>Y", [["+Y]])
map("x", "<leader>p", [["_dP]])
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Buffers
map("n", "<Leader>bd", ":Bd<CR>") -- close current buffer
map("n", "<Leader>wk", ":WhichKey<CR>") -- close current buffer

-- Navigating
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "<Leader>G", ":lua vim.googleSearch()<CR>", { noremap = true })

-- Telescope
map("n", "<C-f>", "<cmd>lua require('telescope.builtin').git_files({show_untracked=true})<cr>")
map("n", "<C-s>", ":Telescope grep_string<CR>")
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<Leader>fd", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/dev'})<cr>") -- search entire dev dir
map("n", "<Leader>fb", ":Telescope file_browser<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fc", ":Telescope git_commits<CR>")
map("n", "<Leader><Space>", ":Telescope git_status<CR>")
map("n", "<Leader>fr", ":Telescope lsp_references<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map(
  "n",
  "<Leader>fm",
  ":<cmd>lua require('telescope.builtin').man_pages({sections={'ALL'}, man_cmd={'apropos', '.*'}})<cr>"
)
map("n", "<Leader>f'", ":Telescope marks<CR>")
map("n", "<Leader>fj", ":Telescope jumplist<CR>")
map("n", "<Space><Space>", ":Telescope buffers<CR>")

-- Testing
map("n", "<leader>tn", '<cmd>lua require("neotest").run.run()<CR>') -- run nearest test
map("n", "<leader>ta", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>') -- run file
map("n", "<leader>to", '<cmd>lua require("neotest").output.open()<CR>') -- show test output
map("n", "<leader>ts", '<cmd>lua require("neotest").summary.toggle()<CR>') -- show test summary

-- Git
map("n", "<Leader>gs", ":Git<CR>")
map("n", "<Leader>gv", ":vertical Git<CR>")
map("n", "<Leader>gR", ":Gitsigns reset_buffer<CR>")
map("n", "<Leader>gw", ":Gitsigns stage_buffer<CR>")
map("n", "<Leader>gp", ":Git push<CR>")
map("n", "<Leader>gl", ":Git log<CR>")
map("n", "<Leader>gb", ":Telescope git_branches<CR>")
map("n", "<Leader>gh", ":Telescope git_bcommits<CR>")

-- Git diff
map("n", "<Leader>df", ":Gvdiffsplit<CR>")
map("n", "<Leader>dh", ":Gvdiffsplit HEAD<CR>")
map("n", "<Leader>dt", ":Git difftool<CR>")

-- Git signs
map("n", "<Leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<Leader>hp", ":Gitsigns preview_hunk<CR>")
map("n", "<Leader>hs", ":Gitsigns stage_hunk<CR>")
map("n", "<Leader>hu", ":Gitsigns undo_stage_hunk<CR>")

-- Documentation
map("n", "<Leader>da", ":Dash<CR>")
map("n", "<Leader>M", ":Man<CR>")

-- Journaling
map("n", "<Leader>Z", ":ZenMode<CR>")

-- Tmux commands
map("n", "<Leader>rs", [[:exe "!tmux send -t 1.2 './manage.py runserver' Enter"<CR><CR>]], { silent = true })
map("n", "<Leader>ptw", [[:exe "!tmux send -t 1.3 'ptw . " . bufname("%") . " ' Enter"<CR><CR>]], { silent = true })
map("n", "<Leader>ma", ":make<CR>", { silent = true })
