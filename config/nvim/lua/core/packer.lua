local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Appearance
  use("NLKNguyen/papercolor-theme")
  use("sainnhe/gruvbox-material")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("kyazdani42/nvim-web-devicons")

  -- Fuzzy finder
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.3" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  -- Utils
  use("nvim-lua/plenary.nvim")
  use("tpope/vim-eunuch") -- Unix helpers, :Move, :Rename, etc.
  use("folke/trouble.nvim")
  use("folke/which-key.nvim") -- Show keymaps

  -- Documentation
  use("rizzatti/dash.vim")

  -- Latex
  use("lervag/vimtex")

  -- Git
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")

  -- Typing
  use("numToStr/Comment.nvim")
  use("tpope/vim-surround")
  use("windwp/nvim-autopairs")
  use("mattn/emmet-vim")
  use("github/copilot.vim")

  -- Journaling
  use("folke/zen-mode.nvim")

  --Completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("uga-rosa/cmp-dictionary")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  --Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")
  use("saadparwaiz1/cmp_luasnip")

  --LSP
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  --Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- formatting & linting
  use("stevearc/conform.nvim")
  use("mfussenegger/nvim-lint")

  -- testing
  use({
    "nvim-neotest/neotest",
    requires = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
    },
  })
  use("nvim-neotest/neotest-python")
  use("nvim-neotest/neotest-go")
  use("nvim-neotest/neotest-jest")
  use("marilari88/neotest-vitest")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
