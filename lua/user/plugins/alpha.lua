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

dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", icons.ui.FindFile .. "  " .. "Find File", ":Telescope find_files <CR>"),
    dashboard.button("n", icons.ui.NewFile .. "  " .. "New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", icons.ui.Project .. "  " .. "Projects", ":Telescope projects <CR>"),
    dashboard.button("r", icons.ui.Files .. "  " .. "Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", icons.ui.FindText .. "  " .. "Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", icons.ui.Gear .. "  " .. "Configuration", ":e $MYVIMRC <CR>"),
    dashboard.button("q", icons.ui.BoldClose .. "  " .. "Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
