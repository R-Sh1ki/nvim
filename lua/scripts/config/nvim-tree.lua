local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!")
  return
end

nvim_tree.setup {
  view = {
    mappings = {
      list = {
        { key = "h", action ="split" },
        { key = "v", action ="vsplit" },
      },
    },
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
      },
    },
  },
}

require"nvim-tree.events".on_file_created(function(file) vim.cmd("edit "..file.fname) end)
