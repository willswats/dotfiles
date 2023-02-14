vim.cmd [[
  augroup format
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ bufnr = bufnr })
  augroup end

  augroup terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * normal a
  augroup END

augroup illuminate
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  augroup end
]]
