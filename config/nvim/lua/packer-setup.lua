local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-setup.lua source <afile> | source $MYVIMRC | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  print("NO PACKER")
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Appearance
  use("NLKNguyen/papercolor-theme")
  use("kyazdani42/nvim-web-devicons")
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Fuzzy finder
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  -- Utils
  use("nvim-lua/plenary.nvim")
  use("tpope/vim-eunuch")
  use("rizzatti/dash.vim")
  use("ludovicchabant/vim-gutentags")
  use("tpope/vim-obsession")
  use("folke/trouble.nvim")

  -- Git
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")
  use("lewis6991/gitsigns.nvim")

  -- Typing
  use("numToStr/Comment.nvim")
  use("tpope/vim-surround")
  use("mattn/emmet-vim")
  use("junegunn/goyo.vim")

  --Completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  --Snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  --LSP
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)