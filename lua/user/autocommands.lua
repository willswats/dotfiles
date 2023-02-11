vim.cmd [[
  augroup general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
  augroup end

  augroup markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
  augroup end

  augroup auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup format
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ bufnr = bufnr })
  augroup end

  augroup terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * normal a
  augroup END
]]
