local keymap = vim.keymap

-- general
keymap.set("n", "<Leader>e", ":Explore<CR>")
keymap.set("n", "<Leader>le", ":Lexplore<CR>")

-- navigation
keymap.set("n", "<C-J>", "<C-W><C-J>")
keymap.set("n", "<C-J>", "<C-W><C-J>")
keymap.set("n", "<C-K>", "<C-W><C-K>")
keymap.set("n", "<C-L>", "<C-W><C-L>")
keymap.set("n", "<C-H>", "<C-W><C-H>")

keymap.set("n", "∆", ":bp<CR>")
keymap.set("n", "˚", ":bn<CR>")

keymap.set("n", "<Leader>tn", ":tabnext<CR>")
keymap.set("n", "<Leader>tp", ":tabprevious<CR>")

--FZF
keymap.set("n", "<C-f>", ":GFiles --cached --others --exclude-standard<CR>")
keymap.set("n", "<C-g>", ":GFiles?<CR>")
keymap.set("n", "<Leader>f", ":Files<CR>")
keymap.set("n", "<Leader>bu", ":Buffers<CR>")
keymap.set("n", "<Leader>gf", ":GFiles?<CR>")
keymap.set("n", "<Leader>ag", ":Ag<CR>")
keymap.set("n", "<Leader>rg", ":Rg<CR>")
keymap.set("n", "<C-s>", ":Rg <C-R><C-W><CR>")
keymap.set("n", "<Leader>l", ":Lines<CR>")

--Fugitive
keymap.set("n", "<Leader>gs", ":vertical Git<CR>")
keymap.set("n", "<Leader>gw", ":Gwrite<CR>")
keymap.set("n", "<Leader>gp", ":Git push<CR>")
keymap.set("n", "<Leader>gb", ":GBrowse<CR>")
keymap.set("n", "<Leader>df", ":Gdiff<CR>")
keymap.set("n", "<Leader>dt", ":Git difftool<CR>")
