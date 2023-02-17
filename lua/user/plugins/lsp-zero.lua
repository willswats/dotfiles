local status_ok_lsp, lsp = pcall(require, "lsp-zero")
if not status_ok_lsp then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

lsp.preset({
  name = 'minimal',
  set_lsp_keymaps = false,
  manage_nvim_cmp = false,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "lua_ls",
  "rust_analyzer",
  "taplo",
})

lsp.set_preferences({
  sign_icons = {
    error = icons.diagnostics.BoldError,
    warn = icons.diagnostics.BoldWarning,
    hint = icons.diagnostics.BoldHint,
    info = icons.diagnostics.BoldInformation
  }
})

-- configure lua language server for neovim
-- see :help lsp-zero.nvim_workspace()
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
