local fn = vim.fn

-- Automatically install packer
local packer_path = fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
  print("Installing packer...")
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Confirm the dependent packer module
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install plugins
return require('packer').startup(function(use)
  ----- Basic Plugins
  use 'lewis6991/impatient.nvim'                                    -- speed up loading modules
  use 'wbthomason/packer.nvim'                                      -- packer manager
  use 'nvim-lua/plenary.nvim'                                       -- useful lua functions
  use 'dstein64/vim-startuptime'                                    -- show startup time

  ----- UI Styles 
  use 'rmehri01/onenord.nvim'                                       -- neovim theme
  use 'kyazdani42/nvim-web-devicons'                                -- icons for some plugins
  use 'glepnir/dashboard-nvim'                                      -- dashboard
  use 'nvim-lualine/lualine.nvim'                                   -- statusline plugin
  use 'kyazdani42/nvim-tree.lua'                                    -- file tree

  ----- Utils 
  use 'terrortylor/nvim-comment'                                    -- comment shortcuts
  use 'lukas-reineke/indent-blankline.nvim'                         -- indent plugin
  use 'akinsho/toggleterm.nvim'                                     -- open terminal
  use 'windwp/nvim-autopairs'                                       -- auto pairs

  ----- Treesittetr
  use 'nvim-treesitter/nvim-treesitter'                             -- parsers and highlighter
  use 'nvim-treesitter/nvim-treesitter-textobjects'                 -- enhance texetobjects selection
  use 'RRethy/nvim-treesitter-textsubjects'                         -- enhance texetsubjects selection
  use 'romgrk/nvim-treesitter-context'                              -- show class/function at top
  use 'p00f/nvim-ts-rainbow'                                        -- rainbow parentheses
  use 'andymass/vim-matchup'                                        -- match keywords

  ----- telescope
  use 'nvim-telescope/telescope.nvim'                               -- telescope: fuzzy finder
  use 'nvim-telescope/telescope-ui-select.nvim'                     -- ui-select
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }  -- c port of fzf(fuzzy finder)
  use 'nvim-telescope/telescope-live-grep-args.nvim'                -- live grep picker
  use 'MattesGroeger/vim-bookmarks'                                 -- vim-bookmarks
  use 'tom-anders/telescope-vim-bookmarks.nvim'                     -- picker for vim-bookmarks
  use 'ahmedkhalf/project.nvim'                                     -- project manager(integrate to telescope)

  ----- LSP
  use 'neovim/nvim-lspconfig'                                       -- configs for nvim lsp client
  use 'williamboman/nvim-lsp-installer'                             -- lsp server manager
  use 'ray-x/lsp_signature.nvim'                                    -- show function signature

  ----- DAP
  use 'mfussenegger/nvim-dap'                                       -- debug adapter protocol client
  use 'rcarriga/nvim-dap-ui'                                        -- dap ui
  use 'theHamsta/nvim-dap-virtual-text'                             -- add virtual text support for dap and nvimtreesitter

  ----- nvim cmp
  use 'hrsh7th/nvim-cmp'                                            -- a completion plugin for neovim
  use 'hrsh7th/cmp-path'                                            -- cmp source for filesystem path
  use 'hrsh7th/cmp-buffer'                                          -- cmp source for buffer words
  use 'hrsh7th/cmp-cmdline'                                         -- cmp source for neovim's cmdline
  use 'hrsh7th/cmp-nvim-lsp'                                        -- neovim's built-in language server client
  use 'f3fora/cmp-spell'                                            -- spell for nvim-cmp
  use 'SirVer/ultisnips'                                            -- speed in vim
  use 'quangnguyen30192/cmp-nvim-ultisnips'                         -- ultisnips for nvim-cmp

  ----- markdown
  use { 'iamcco/markdown-preview.nvim',                             -- markdown previewer
    run = function() vim.fn["mkdp#util#install"]() end }
  use 'preservim/vim-markdown'                                      -- markdown shortcuts
  use 'ekickx/clipboard-image.nvim'                                 -- a plugin to paste images into markdown files.

  ----- Latex
  use 'lervag/vimtex'                                               -- latex plugins

  if packer_boostrap then
    packer.sync()
  end
end)
