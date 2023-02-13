local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
    })

-- make sure this servers are installed
-- see :help lsp-zero.ensure_installed()
lsp.ensure_installed({
    "marksman",
    "html",
    "cssls",
    "jsonls",
    "tsserver",
    "lua_ls",
    "rust_analyzer",
    "taplo",
})

-- configure lua language server for neovim
-- see :help lsp-zero.nvim_workspace()
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
