-- [ Session-manager setup ]
local path = require("plenary.path")
local status_ok, session_manager = pcall(require, "session_manager")
if not status_ok then
  vim.notify("session_manager not found!")
  return
end

session_manager.setup({
  -- The directory where the session files will be saved.
  session_dir = path:new(vim.fn.stdpath('data'), 'session'),
  -- The character to which the path separator will be replaced for session files.
  path_replace = '__',
  -- The character to which the colon symbol will be replaced for session files.
  colon_replacer = '++',
  -- Define which file to open when Neovim is started
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- CurrentDir,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_filetypes = {
    'gitcommit',
  },
  autosave_only_in_session = false,
  max_path_length = 80,
})

vim.cmd([[
  augroup _open_nvim_tree
    autocmd! * <buffer>
    autocmd SessionLoadPost * silent! lua require("nvim-tree").toggle(false, true)
  augroup end
]])
