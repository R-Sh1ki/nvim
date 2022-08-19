local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('lualine not found!')
  return
end

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('lualine not found!')
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = { 
    added = { fg = '#98be65' }, 
    modified = { fg = '#ecbe7b' },
    removed = { fg = '#ec5f67' },
  },
  cond = hide_in_width
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local file_name = {
  'filename',
  file_status = true,       -- Displays file status (readonly status, modified status)
  path = 1,                 -- 1: Relative path
  shorting_target = 30,     -- Shortens path to leave 40 spaces in the window
  symbols = {
    modified = '  ',       -- Text to show when the file is modified.
    readonly = '  ',       -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]',  -- Text to show for unnamed buffers.
  },
}

local tab = function()
  return 'Tab:' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local fileformat = {
  'fileformat',
  symbols = {
    dos = ' ',  -- e70f
    mac = ' ',  -- e711
    unix = ' ', -- e73a
  }
}

lualine.setup ({
  options = {
    icons_enable = true,
    theme = 'onenord',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', diagnostics },
    lualine_c = { file_name },
    lualine_x = { diff, tab, "encoding", },
    lualine_y = { 'filetype', fileformat }, 
    lualine_z = { 'progress', 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { file_name },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
