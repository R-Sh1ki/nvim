-- Basic Config
require("impatient").enable_profile()
require('scripts.plugins')
require('scripts.options')
require('scripts.keymaps')

-- UI style
require('scripts.theme')
require('scripts.config.lualine')
require('scripts.config.dashboard')
require('scripts.config.nvim-tree')

-- Utils
require('scripts.config.comment')
require('scripts.config.indent-blankline')
require('scripts.config.toggleterm')
require('scripts.config.autopairs')

-- Treesitter
require('scripts.config.nvim-treesitter')

-- Telescope
require('scripts.config.telescope')
require('scripts.config.project')

-- CMP
require('scripts.config.cmp')
require('scripts.config.ultisnips')

-- Lsp
require('scripts.lsp.lsp')

-- Markdown
require('scripts.config.markdown')
require('scripts.config.markdown-clipboard-img')

-- Latex

-- Dap
require('scripts.dap.dap')
require('scripts.dap.dap-ui')
require('scripts.dap.dap-virtual-text')

