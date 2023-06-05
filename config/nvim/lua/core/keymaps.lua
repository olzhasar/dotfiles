local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- General
map("n", "<Leader>e", ":Explore<CR>")
map("n", "<Leader>le", ":Lexplore<CR>")
map("v", "<Leader>y", [["+y]]) -- copy to system clipboard
map("n", "<Leader>y", [["+y]])
map("n", "<Leader>bd", ":Bd<CR>") -- close current buffer
map("n", "<Leader>wk", ":WhichKey<CR>") -- close current buffer

-- Telescope
map("n", "<C-f>", ":Telescope git_files<CR>")
map("n", "<C-s>", ":Telescope grep_string<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fc", ":Telescope git_commits<CR>")
map("n", "<Leader><Space>", ":Telescope git_status<CR>")
map("n", "<Leader>fd", ":Telescope lsp_definitions<CR>")
map("n", "<Leader>fr", ":Telescope lsp_references<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Space><Space>", ":Telescope file_browser<CR>")

-- Trouble
map("n", "<Leader>tr", ":TroubleToggle<CR>")

-- Fugitive
map("n", "<Leader>gs", ":vertical Git<CR>")
map("n", "<Leader>gp", ":Git push<CR>")
map("n", "<Leader>gb", ":Git branch<CR>")
map("n", "<Leader>df", ":Gvdiffsplit<CR>")
map("n", "<Leader>dh", ":Gvdiffsplit HEAD<CR>")
map("n", "<Leader>dt", ":Git difftool<CR>")

-- Git signs
map("n", "<Leader>gw", ":Gitsigns stage_buffer<CR>")
map("n", "<Leader>hR", ":Gitsigns reset_buffer<CR>")
map("n", "<Leader>hp", ":Gitsigns preview_hunk<CR>")
map("n", "<Leader>hh", ":Gitsigns stage_hunk<CR>")
map("n", "<Leader>hu", ":Gitsigns undo_stage_hunk<CR>")

-- Documentation
map("n", "<Leader>da", ":Dash<CR>")
map("n", "<Leader>M", ":Man<CR>")

-- Tmux commands
map("n", "<Leader>rs", [[:exe "!tmux send -t 1.2 './manage.py runserver' Enter"<CR><CR>]], { silent = true })
map("n", "<Leader>ptw", [[:exe "!tmux send -t 1.3 'ptw . " . bufname("%") . " ' Enter"<CR><CR>]], { silent = true })
map("n", "<Leader>ma", [[:exe "!tmux send -t 1.2 'make' Enter"<CR><CR>]], { silent = true })
