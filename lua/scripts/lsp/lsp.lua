local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lsp-installer not found!")
  return
end

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("nvim-lspconfig not found!")
  return
end

-- neovim diagnostic signs
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

-- neovim diagnostic config
vim.diagnostic.config({
  virtual_text = false,
  signs = { active = signs },
  update_in_insert = true,
  severity_sort = true,
  float = { border = 'rounded' }
})

-- neovim diagnostic keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'df', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'dl', vim.diagnostic.setloclist, opts)

-- neovim lsp handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- LSP installer config
lsp_installer.setup {
  -- auto install language servers
  automatic_installation = true,
}

-- LSP list
local servers = {
  bashls = require('scripts.lsp.config.default'),                 -- bash
  ccls = require('scripts.lsp.config.default'),                   -- c/c++
  clangd = require('scripts.lsp.config.default'),                 -- c/c++
  cmake = require('scripts.lsp.config.default'),                  -- cmake
  cssls = require('scripts.lsp.config.default'),                  -- css
  eslint = require('scripts.lsp.config.default'),                 -- js/ts
  gopls = require('scripts.lsp.config.default'),                  -- go
  html = require('scripts.lsp.config.default'),                   -- html
  jsonls = require('scripts.lsp.config.default'),                 -- json
  jdtls = require('scripts.lsp.config.default'),                  -- java
  julials = require('scripts.lsp.config.default'),                -- julia 
  kotlin_language_server = require('scripts.lsp.config.default'), -- kotlin
  ltex = require('scripts.lsp.config.default'),                   -- latex/markdown
  sumneko_lua = require("scripts.lsp.config.lua"),                -- lua
  phpactor = require('scripts.lsp.config.default'),               -- php
  pyright = require("scripts.lsp.config.default"),                -- python
  solargraph = require('scripts.lsp.config.default'),             -- ruby
  rust_analyzer = require('scripts.lsp.config.default'),          -- rust
  sqlls = require('scripts.lsp.config.default'),                  -- sql
  vuels = require('scripts.lsp.config.default'),                  -- vue
  lemminx = require('scripts.lsp.config.default'),                -- xml/xsl
  yamlls = require('scripts.lsp.config.default'),                 -- yaml

}

-- Automatically install LSP servers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- Add LSP configs
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>dc', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>dh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>di', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>s?', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting, bufopts)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[  
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end

  require('lsp_signature').on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for name, config in pairs(servers) do
  local lsp_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 }
  }
  lsp_opts = vim.tbl_deep_extend("force", config, lsp_opts)
  lsp_config[name].setup(lsp_opts)
end
