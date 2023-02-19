local status_ok_alpha, alpha = pcall(require, "alpha")
if not status_ok_alpha then
  return
end

local status_ok_dashboard, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok_dashboard then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

dashboard.section.buttons.val = {
  dashboard.button("n", icons.ui.NewFile .. "  " .. "New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", icons.ui.Files .. "  " .. "Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("p", icons.ui.Project .. "  " .. "Projects", ":Telescope projects <CR>"),
  dashboard.button("c", icons.ui.Gear .. "  " .. "Configuration", ":e $MYVIMRC <CR>"),
  dashboard.button("q", icons.ui.BoldClose .. "  " .. "Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
