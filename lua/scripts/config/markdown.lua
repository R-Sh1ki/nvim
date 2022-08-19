vim.g.mkdp_auto_start = 0   -- 1: auto open preview window when open markdown file.
vim.g.mkdp_auto_open = 1    -- 1: auto check and open preview window.
vim.g.mkdp_auto_close = 1   -- 1: auto close preview window.

vim.g.mkdp_refresh_show = 0 -- 1: auto refresh markdown as you edit or move the cursor.
vim.g.vim_markdown_math = 1

vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''

vim.g.mkdp_preview_options = {
  ['mkit'] = {},
  ['katex'] = {},
  ['uml'] = {},
  ['maid'] = {},
  ['disable_sync_scroll'] = 0,
  ['sync_scroll_type'] = 'middle',
  ['hide_yaml_meta'] = 1,
  ['sequence_diagrams'] = {},
  ['flowchart_diagrams'] = {},
  ['content_editable'] = false,
  ['disable_filename'] = 0
}

vim.g.mkdp_filetypes = {'markdown'}
vim.g.mkdp_theme = 'dark'
-- vim.g.mkdp_path_to_chrome = [[ C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe ]]
