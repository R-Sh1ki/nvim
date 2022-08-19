local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("telescope not found!")
  return
end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = {
      shorten= { len = 3, exclude = {1, -1} },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    live_grep_args = {
      auto_quoting = true, 
    },
  },
}


telescope.load_extension('fzf')
telescope.load_extension("ui-select")
telescope.load_extension('live_grep_args')
telescope.load_extension('vim_bookmarks')

--telescope.load_extension('dap')

