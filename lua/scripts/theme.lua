local status_ok, onenord = pcall(require, 'onenord')
if not status_ok then
  return
end

require('onenord').setup({
  theme = 'dark',         -- dark or light
  borders = true,         -- enable split window borders
  fade_nc = false,
  -- variable styles
  styles = {
    comments = 'NONE',
    strings = 'bold',
    keywords = 'bold',
    functions = 'bold',
    variables = 'bold',
    diagnostics = 'bold,underline',
  },
  disable = {
    background = false,
    cursorline = false,
    eob_lines = true,
  },
  inverse = {
    match_paren = false,
  },
  custom_highlights = {},
  custom_colors = {},
})
