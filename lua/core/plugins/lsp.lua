local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'quick_lint_js', 'lua_ls', 'marksman', 'pyright', 'tsserver'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- require("mason").setup()
--
-- require("mason-lspconfig").setup({
--     ensure_installed = {
--         "quick_lint_js", -- JavaScript
--         "lua_ls", -- Lua
--         "marksman", -- Markdown
--         "pyright", -- Python
--     }
-- })
--
-- local lspconfig = require("lspconfig")
-- lspconfig.quick_lint_js.setup{}
-- lspconfig.lua_ls.setup{
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = {"vim"}
--             }
--         }
--     }
-- }
-- lspconfig.marksman.setup{}
-- lspconfig.pyright.setup{}
--
