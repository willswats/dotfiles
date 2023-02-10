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
"nvim-lua/plenary.nvim",
"windwp/nvim-autopairs",
"numToStr/Comment.nvim",
"JoosepAlviste/nvim-ts-context-commentstring",
 "nvim-tree/nvim-web-devicons",
"nvim-tree/nvim-tree.lua",
"akinsho/bufferline.nvim",
"nvim-lualine/lualine.nvim",
"tamago324/lir.nvim",
"akinsho/toggleterm.nvim",
 "ahmedkhalf/project.nvim",
"lukas-reineke/indent-blankline.nvim",
 "goolord/alpha-nvim",
"folke/which-key.nvim",

-- Colorscheme
"folke/tokyonight.nvim",

-- cmp
"hrsh7th/nvim-cmp",
 "hrsh7th/cmp-buffer",
"hrsh7th/cmp-path",
"saadparwaiz1/cmp_luasnip",
 "hrsh7th/cmp-nvim-lsp",
 "hrsh7th/cmp-nvim-lua",

 -- Snippets
"L3MON4D3/LuaSnip",
"rafamadriz/friendly-snippets",

"folke/neodev.nvim",

-- dap
"mfussenegger/nvim-dap",
"rcarriga/nvim-dap-ui",


	-- LSP
	"neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
  -- "RRethy/vim-illuminate",

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
		"nvim-treesitter/nvim-treesitter",
	

	-- Git
	"lewis6991/gitsigns.nvim",
}

lazy.setup(plugins)
