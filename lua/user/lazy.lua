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

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

local plugins = {
    -- Dependent
    "nvim-lua/plenary.nvim",

    -- General
    "nvim-tree/nvim-web-devicons", -- Icons
    "nvim-tree/nvim-tree.lua", -- Tree
    "akinsho/bufferline.nvim", -- Bufferline
    "nvim-lualine/lualine.nvim", -- Statusline
    "nvim-telescope/telescope.nvim", -- Telescope
    "folke/which-key.nvim", -- Which key
    "goolord/alpha-nvim", -- Dashboard
    "ahmedkhalf/project.nvim", -- Auto CD
    "windwp/nvim-autopairs", -- Auto pair
    "lukas-reineke/indent-blankline.nvim", -- Show indent line
    "RRethy/vim-illuminate", -- Illuminate text

    -- Colorscheme
    "lunarvim/darkplus.nvim",

    -- Comment
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",

    -- Debug
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    
    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/SchemaStore.nvim",

    -- Format & Lint
    "jose-elias-alvarez/null-ls.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",    

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",

    -- Git
    "lewis6991/gitsigns.nvim",
}

lazy.setup(plugins)
