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
map("n", "<Leader>bg", ":BackgroundSwitch<CR>")
map("n", "Q", "<nop>")
map("n", "<Leader>F", "<cmd>lua require('conform').format({ lsp_fallback=true })<CR>")

-- Copy pasting
map("n", "<Leader>y", [["+y]])
map("x", "<Leader>y", [["+y]])
map("n", "<Leader>Y", [["+Y]])
map("x", "<Leader>Y", [["+Y]])
map("x", "<leader>p", [["_dP]])
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Buffers
map("n", "<Leader>bd", ":Bd<CR>") -- close current buffer
map("n", "<C-i>", "<C-i>")
map("n", "<Tab>", "<C-^>")
map("n", "<C-n>", ":bnext<CR>")

-- Quickfix
map("n", "]q", ":cnext<CR>zz", { silent = true })
map("n", "[q", ":cprev<CR>zz", { silent = true })
map("n", "<Leader>qo", ":copen<CR>", { silent = true })
map("n", "<Leader>qc", ":cclose<CR>", { silent = true })

-- Navigating
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- FZF
map("n", "<C-f>", ":GFiles --cached --others --exclude-standard<CR>")
map("n", "<C-s>", ":Rg <C-R><C-W><CR>")
map("n", "<C-e>", ":Buffers<CR>")
map("n", "<Leader>fb", ":Buffers<CR>")
map("n", "<Leader>ff", ":Files<CR>")
map("n", "<Leader>fa", ":Files<CR>")
map("n", "<Leader>fp", ":Files ~/dev<CR>")
map("n", "<Leader>fl", ":Files ~/Downloads<CR>")
map("n", "<Leader>fg", ":RG<CR>")
map("n", "<Leader>fs", ":GFiles?<CR>")
map("n", "<Leader><Space>", ":GFiles?<CR>")
map("n", "<Leader>fh", ":History<CR>")

-- Git
map("n", "<Leader>gs", ":Git<CR>")
map("n", "<Leader>gv", ":vertical Git<CR>")
map("n", "<Leader>gb", ":Git branch<CR>")
map("n", "<Leader>gR", ":Gitsigns reset_buffer<CR>")
map("n", "<Leader>gw", ":Gitsigns stage_buffer<CR>")
map("n", "<Leader>gl", ":Git log<CR>")
map("n", "<Leader>gL", ":Gllog<CR>")
map("n", "<Leader>gB", ":Git blame<CR>")
map("n", "<Leader>gh", ":BCommits<CR>")

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
map("n", "<Leader>k", ":Man <C-r><C-w><CR>")
map("n", "<Leader>M", ":Man ")

-- Journaling
map("n", "<Leader>Z", ":ZenMode<CR>")

-- Make commands
map("n", "<Leader>ma", ":Make<CR>", { silent = true })
map("n", "<Leader>mr", ":Make run<CR>", { silent = true })
map("n", "<Leader>mt", ":Make test<CR>")
map("n", "<Leader>mc", ":Make check<CR>")
map("n", "<Leader>m<Space>", ":Make ")
