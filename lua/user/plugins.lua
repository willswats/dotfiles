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
    "nvim-lua/plenary.nvim", -- Used by many plugins
    "windwp/nvim-autopairs", -- Autopair
    "numToStr/Comment.nvim", -- Comment
    "JoosepAlviste/nvim-ts-context-commentstring", -- Comment
    "nvim-tree/nvim-web-devicons", -- Icons
    "nvim-tree/nvim-tree.lua", -- Tree
    "akinsho/bufferline.nvim", -- Buffers
    "nvim-lualine/lualine.nvim", -- Lualine
    "ahmedkhalf/project.nvim", -- Change directory automatically
    "goolord/alpha-nvim", -- Dashboard
    "folke/which-key.nvim", -- Which key popup
    "lukas-reineke/indent-blankline.nvim", -- Indent line

    "lunarvim/darkplus.nvim", -- Colorscheme

    "hrsh7th/nvim-cmp", -- Completions
    "hrsh7th/cmp-buffer", -- Buffer completions
    "hrsh7th/cmp-path", -- Path completions
    "hrsh7th/cmp-nvim-lsp", -- LSP completions
    "hrsh7th/cmp-nvim-lua", -- Lua completions
    "saadparwaiz1/cmp_luasnip", -- LuaSnip completions

    "L3MON4D3/LuaSnip", -- Lua snippets
    "rafamadriz/friendly-snippets", -- More snippets

    "neovim/nvim-lspconfig", -- LSP
    "williamboman/mason.nvim", -- LSP installer
    "williamboman/mason-lspconfig.nvim", -- LSP installer config
    "jose-elias-alvarez/null-ls.nvim", -- Formatters and linters
    "b0o/SchemaStore.nvim", -- jsonls schemas

    "nvim-telescope/telescope.nvim", -- Telescope

    "nvim-treesitter/nvim-treesitter", -- Treesitter

    "lewis6991/gitsigns.nvim", -- Git signs

    "mfussenegger/nvim-dap", -- Debug
    "rcarriga/nvim-dap-ui", -- Debug UI
}

lazy.setup(plugins)
