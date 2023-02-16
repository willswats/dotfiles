vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.cmd [[
      setlocal nonumber
      normal a
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    vim.opt.showtabline = 0
  end,
})

vim.api.nvim_create_autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    vim.opt.showtabline = 2
  end,
})
