local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
  return
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
  return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
  return
end

local status_ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok_cmp_nvim_lsp then
  return
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "cssls",
    "jsonls",
    "tsserver",
    "lua_ls",
    "rust_analyzer",
    "taplo",
  },
  automatic_installation = true,
})

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_settings = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
  },
}

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
      settings = lsp_settings,
    })
  end,
})
