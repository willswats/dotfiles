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
local mappings = {
  ["w"] = { "<cmd>w!<cr>", "Write format" },
  ["W"] = { "<cmd>noautocmd w<cr>", "Write" },
  ["q"] = { "<cmd>confirm q<cr>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<cr>", "No highlight" },
  ["c"] = { "<cmd>e $MYVIMRC<cr>", "Configuration" },
  ["p"] = { "<cmd>Lazy<cr>", "Plugins" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  b = {
    name = "Buffer",
    p = { "<cmd>BufferLinePick<cr>", "Pick" },
    P = { "<cmd>BufferLinePickClose<cr>", "Pick close" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close right" },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
    L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
    d = { "<cmd>confirm bd<cr>", "Delete buffer" },
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
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    b = { "<cmd>Telescope buffers previewer=false<cr>", "Buffers" },
    c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
    r = { "<cmd>Telescope resume<cr>", "Resume" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    g = {
      name = "Git",
      s = { "<cmd>Telescope git_status<cr>", "Status" },
      b = { "<cmd>Telescope git_branches<cr>", "Branches" },
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Buffer commits" },
    }
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev hunk" },
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff" },
  },
  l = {
    name = "LSP",
    i = { "<cmd>LspInfo<cr>", "Info" },
    m = { "<cmd>Mason<cr>", "Mason" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
    A = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens action" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    o = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open float" }
  },
  t = {
    name = "Terminal",
    ["1"] = { "<cmd>ToggleTerm 1<cr>", "Toggle 1" },
    ["2"] = { "<cmd>ToggleTerm 2<cr>", "Toggle 2" },
    ["3"] = { "<cmd>ToggleTerm 3<cr>", "Toggle 3" },
    ["4"] = { "<cmd>ToggleTerm 4<cr>", "Toggle 4" },
    ["5"] = { "<cmd>ToggleTerm 4<cr>", "Toggle 5" },
    ["6"] = { "<cmd>ToggleTerm 4<cr>", "Toggle 6" },
    ["7"] = { "<cmd>ToggleTerm 4<cr>", "Toggle 7" },
    ["8"] = { "<cmd>ToggleTerm 4<cr>", "Toggle 8" },
    ["9"] = { "<cmd>ToggleTerm 4<cr>", "Toggle 9" },
    a = { "<cmd>ToggleTermToggleAll<cr>", "Toggle all" },
    s = {
      name = "Send",
      c = { "<cmd>ToggleTermSendCurrentLine<cr>", "Current line" },
      v = { "<cmd>ToggleTermSendVisualLines<cr>", "Visual line" },
      V = { "<cmd>ToggleTermSendVisualSelection<cr>", "Visual selection" },
    },
    g = { "<cmd>lua LAZYGIT_TOGGLE()<cr>", "Lazygit" }
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

local vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment" },
  m = {
    name = "Markdown",
    t = { "<cmd>MkdnToggleToDo<cr>", "Toggle to-do" },
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
