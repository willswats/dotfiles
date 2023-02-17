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

local servers = {
  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "lua_ls",
  "rust_analyzer",
  "taplo",
  "omnisharp_mono"
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.plugins.lsp.handlers").on_attach,
    capabilities = require("user.plugins.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
