local options = {
  autoindent = true,                        -- take indent for new line from previous line
  autoread = true,             
  background = "dark",                      -- used for highlight colors
  clipboard = "unnamedplus",                -- allows neovim to access the system clipboard
  cmdheight = 2,                            -- more space in the neovim command line for displaying messages
  cursorcolumn = false,                     -- cursor column.
  cursorline = true,                        -- highlight the current line
  fileencoding = "utf-8",                   -- the encoding written to a file
  foldmethod = "expr",                      -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()", 
  foldenable = false,                       -- no fold to be applied when open a file
  foldlevel = 99,                           -- if not set this, fold will be everywhere
  -- hlsearch = false,                          -- highlight all matches on previous search pattern
  ignorecase = true,                        -- ignore case in search patterns
  showmode = true,                          -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                          -- always show tabs
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indenting smarter again
  splitbelow = true,                        -- force all horizontal splits to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window
  timeoutlen = 500,                         -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                          -- enable persistent undo
  updatetime = 300,                         -- faster completion (4000ms default)
  expandtab = true,                         -- convert tabs to spaces
  shiftwidth = 2,                           -- the number of spaces inserted for each indentation
  tabstop = 2,                              -- insert 2 spaces for a tab
  number = true,                            -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                          -- set number column width to 2 {default 4}
  mouse = "a",                              -- enable the use of mouse clicFindFileks
  wrap = false,                             -- long lines wrap and continue on the next line
  textwidth = 80,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
