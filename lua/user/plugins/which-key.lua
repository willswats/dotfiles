local status_ok_which_key, which_key = pcall(require, "which-key")
if not status_ok_which_key then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,
      suggestions = 20,
    }, -- use which-key for spelling hints
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
    separator = icons.ui.BoldArrowRight, -- symbol used between a key and it's label
    group = icons.ui.Plus, -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

-- Used throughout mappings
local tree_close = "<cmd>NvimTreeClose<cr>"

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment" },
  m = {
    name = "Markdown",
    t = { "<cmd>MkdnToggleToDo<cr>", "Toggle to-do" },
  }
}

local mappings = {
  ["w"] = { "<cmd>w!<cr>", "Write format" },
  ["W"] = { "<cmd>noautocmd w<cr>", "Write" },
  ["q"] = { tree_close .. "<cmd>confirm q<cr>", "Quit" },
  ["c"] = { function(bufnr) BUF_KILL("bd", bufnr, false) end, "Close buffer" },
  ["h"] = { "<cmd>nohlsearch<cr>", "No highlight" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  [";"] = { "<cmd>Alpha<cr>", "Alpha" },
  b = {
    name = "Buffer",
    p = { "<cmd>BufferLinePick<cr>", "Pick" },
    c = { "<cmd>BufferLinePickClose<cr>", "Pick close" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close right" },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
    L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
  },
  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },
  p = {
    name = "Plugin",
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    c = { "<cmd>Lazy clean<cr>", "Clean" },
    C = { "<cmd>Lazy clear<cr>", "Clear" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    p = { "<cmd>Lazy profile<cr>", "Profile" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    d = { "<cmd>Lazy debug<cr>", "Debug" },
  },
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  },
  g = {
    name = "Git",
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branches" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commits" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff" },
  },
  l = {
    name = "LSP",
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer diagnostics" },
    e = { "<cmd>Telescope quickfix<cr>", "Quick fix" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
    f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens action" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    o = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open float" }
  },
  t = {
    name = "Terminal",
    f = { tree_close .. "<cmd>term fish<cr>", "Fish" },
    b = { tree_close .. "<cmd>term bash<cr>", "Bash" },
    g = { tree_close .. "<cmd>term lazygit<cr>", "Lazygit" }
  },
  m = {
    name = "Markdown",
    t = { "<cmd>MkdnToggleToDo<cr>", "Toggle to-do" },
    l = { "<cmd>MkdnNextLink<cr>", "Next link" },
    L = { "<cmd>MkdnPrevLink<cr>", "Prev link" },
    h = { "<cmd>MkdnNextHeading<cr>", "Next heading" },
    H = { "<cmd>MkdnPrevHeading<cr>", "Prev heading" },
    f = { "<cmd>MkdnFoldSection<cr>", "Fold" },
    F = { "<cmd>MkdnUnfoldSection<cr>", "Unfold" },
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
