local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter not found!")
  return
end

configs.setup {
  -- <nvim-treesitter>
  ensure_installed = { 
    'c', 'cpp', 'markdown', 'latex', 'java', 'dart', 'python', 'html', 'css',
    'javascript', 'typescript', 'php', 'http', 'json', 'json5', 'yaml', 'bash',
  },
  -- Install parsers synchronously
  sync_install = false,
  -- Automatically install missing parsers
  auto_install = false,
  -- List of parsers to ignore installing
  ignore_install = {},
  -- Highlighter configuration
  highlight = {
    enable = true,  -- enable highlighter
    disable = {},   -- list of disable language
    additional_vim_regex_highlighting = false,
  },
  -- Indentation
  indent = { enable = true },

  -- <nvim-treesitter-textobjects>
  textobjects = {
    swap = { enable = false },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = false,
      lookahead = true,
      goto_next_start = { ["]]"] = "@function.outer" },
      goto_next_end = { ["]["] = "@function.outer" },
      goto_previous_start = { ["[["] = "@function.outer" },
      goto_previous_end = { ["[]"] = "@function.outer" },
    },
    -- TODO: what is lsp_interop
    lsp_interop = {
      enable = false,
      border = 'none',
      peek_definition_code = {
        ["<leader>pf"] = "@function.outer",
        ["<leader>pF"] = "@class.outer",
      },
    }
  },

  -- <nvim-treesitter-textsubjects>
  textsubjects = {
    enable = true,
    prev_selection = ',',   -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },

  -- <nvim-ts-rainbow>
  rainbow = {
    enable = true,
    extended_mode = true,   -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000,  -- Do not enable for files with more than 1000 lines, int
  },

  -- <vim-matchup>
  matchup = { enable = true },
}
