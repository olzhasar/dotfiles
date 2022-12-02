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
    autocmd BufWritePost plugins-setup.lua source <afile> | source $MYVIMRC | PackerSync
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
  use("akinsho/bufferline.nvim")

  -- Fuzzy finder
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  -- Utils
  use("nvim-lua/plenary.nvim")
  use("tpope/vim-eunuch")
  use("rizzatti/dash.vim")
  use("ludovicchabant/vim-gutentags")
  use("tpope/vim-obsession")

  -- Git
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")

  -- Typing
  use("numToStr/Comment.nvim")
  use("tpope/vim-surround")
  use("mattn/emmet-vim")
  use("junegunn/goyo.vim")


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
