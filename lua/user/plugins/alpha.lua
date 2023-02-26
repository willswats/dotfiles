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
  dashboard.button("o", icons.ui.Files .. "  " .. "Old files", ":Telescope oldfiles<cr>"),
  dashboard.button("p", icons.ui.Project .. "  " .. "Projects", ":Telescope projects<cr>"),
  dashboard.button("s", icons.ui.Package .. "  " .. "Sync plugins", ":Lazy sync<cr>"),
  dashboard.button("c", icons.ui.Gear .. "  " .. "Configuration", ":e $MYVIMRC<cr>"),
  dashboard.button("q", icons.ui.BoldClose .. "  " .. "Quit", ":qa<cr>"),
}

alpha.setup(dashboard.opts)
