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
  manage_nvim_cmp = true,
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
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warning,
    hint = icons.diagnostics.Hint,
    info = icons.diagnostics.Information
  }
})

-- Explicitly select completions
lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})

-- configure lua language server for neovim
-- see :help lsp-zero.nvim_workspace()
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
