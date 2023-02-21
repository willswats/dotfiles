-- Set q to close files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "lsp-installer",
    "null-ls-info",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    vim.opt_local.buflisted = false
  end,
})

-- Show highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Auto format on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Open nvim-tree for directories
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    require("nvim-tree.api").tree.open()
  end
})

-- Hide tabline when alpha is active
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "AlphaReady",
  callback = function()
    vim.opt.showtabline = 0
  end,
})

-- Display tabline when alpha is not active
vim.api.nvim_create_autocmd({ "BufUnload" }, {
  buffer = 0,
  callback = function()
    vim.opt.showtabline = 2
  end,
})
