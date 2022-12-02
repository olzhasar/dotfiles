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

--copying
