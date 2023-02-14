local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok_lazy, lazy = pcall(require, "lazy")
if not status_ok_lazy then
  return
end

local plugins = {
  -- Dependencies
  "nvim-lua/plenary.nvim", -- Dependency for many plugins
  "MunifTanjim/nui.nvim", -- Dependency for noice.nvim

  -- General
  "nvim-treesitter/nvim-treesitter", -- Treesitter
  "nvim-tree/nvim-web-devicons", -- Icons
  "nvim-tree/nvim-tree.lua", -- Tree
  "akinsho/bufferline.nvim", -- Bufferline
  "nvim-lualine/lualine.nvim", -- Statusline
  "goolord/alpha-nvim", -- Dashboard
  "nvim-telescope/telescope.nvim", -- Telescope
  "folke/which-key.nvim", -- Which key
  "folke/noice.nvim", -- Replaces UI
  "lewis6991/gitsigns.nvim", -- Git signs
  "jose-elias-alvarez/null-ls.nvim", -- Format & Lint
  "numToStr/Comment.nvim", -- Comment
  "JoosepAlviste/nvim-ts-context-commentstring", -- Comment
  "ahmedkhalf/project.nvim", -- Auto CD
  "windwp/nvim-autopairs", -- Auto pair
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre", -- Fix blue cursor
  }, -- Show indent line
  "RRethy/vim-illuminate", -- Illuminate text
  "mfussenegger/nvim-dap", -- Debug
  "rcarriga/nvim-dap-ui", -- Debug UI
  "catppuccin/nvim", -- Colorscheme

  "jakewvincent/mkdnflow.nvim", -- Markdown editing

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim', -- LSP configuration
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
}

lazy.setup(plugins)
