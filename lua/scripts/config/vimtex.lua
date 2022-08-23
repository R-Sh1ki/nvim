-- Disable imaps (using Ultisnips)
vim.g.vimtex_imaps_enabled = 0
-- Do not open pdfviewer on compile
vim.g.vimtex_view_automatic = 0
-- PDF viewer settings
vim.g.forward_search_on_start = 0

--
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_compiler_progname = 'nvr'

-- LaTex engines
vim.g.vimtex_compiler_latexmk_engines = {
  _ = '-pdf',
  xelatex = '-xelatex',
  bibtex = '-bibtex',
  pdflatex = '-pdf',
}

vim.g.vimtex_compiler_latexmk = {
  build_dir = "./build",
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  options = {
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
    '-shell-escape',
  }
}

-- Auto clean auxiliary files.
vim.cmd [[
augroup vimtex_config
  au!
  au User VimtexEventQuit     VimtexStop
  au User VimtexEventQuit     VimtexClean
augroup END
]]

-- au User VimtexEventInitPost VimtexCompile

