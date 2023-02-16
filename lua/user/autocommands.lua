vim.cmd [[
  augroup general
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  augroup end

  augroup terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * normal a
  augroup END

  augroup lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
  augroup end

  augroup alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup illuminate
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  augroup end
]]
