local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local icons_status_ok, icons = pcall(require, "user.icons")
if not icons_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = icons.ui.File,
                symlink = icons.ui.FileSymlink,
                folder = {
                    arrow_open = icons.ui.ChevronShortUp,
                    arrow_closed = icons.ui.ChevronShortDown,
                    default = icons.ui.Folder,
                    open = icons.ui.FolderOpen,
                    empty = icons.ui.EmptyFolder,
                    empty_open = icons.ui.EmptyFolderOpen,
                    symlink = icons.ui.FileSymlink,
                    symlink_open = icons.ui.FileSymlink,
                },
                git = {
                    unstaged = icons.git.FileUnstaged,
                    staged = icons.git.FileStaged,
                    unmerged = icons.git.FileUnmerged,
                    renamed = icons.git.FileRenamed,
                    untracked = icons.git.FileUntracked,
                    deleted = icons.git.FileDeleted,
                    ignored = icons.git.FileIgnored,
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
        },
    },
    view = {
        width = 30,
        side = "left",
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h",                  cb = tree_cb "close_node" },
                { key = "v",                  cb = tree_cb "vsplit" },
            },
        },
    },
}