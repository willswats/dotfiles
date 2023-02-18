local status_ok_nvim_autopairs, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok_nvim_autopairs then
  return
end

local status_ok_cmp, cmp = pcall(require, "cmp")
if not status_ok_cmp then
  return
end

nvim_autopairs.setup({
  check_ts = true, -- Treesitter
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
  enable_check_bracket_line = true
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
