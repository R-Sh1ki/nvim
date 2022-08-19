local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  vim.notify("project.nvim not found!")
  return
end

project.setup({
  -- manual mode command `:ProjectRoot`
  manual_mode = false,
  -- methods of detecting the root directory
  detection_methods = { "pattern", "lsp" },
  -- patterns used to detect root dir (`pattern` must be in `detection_methods` table)
  patterns = { ".git", "build", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "CMakeLists.txt", "package.json" },
  -- table of `lsp` clients to ignore by name
  ignore_lsp = {},
  -- don't calculate root dir on specific directories
  exclude_dirs = {},
  -- show hidden files in telescope
  show_hidden = true,
  -- silent mode when `project.nvim` changes directory
  silent_chdir = true,
  -- path where `project.nvim` store the history
  datapath = vim.fn.stdpath("data"),
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  vim.notify("telescope not found, can't use `:Telescoep projects`!")
	return
end

telescope.load_extension('projects')
