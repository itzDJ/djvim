require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "quick_lint_js", -- JavaScript
        "lua_ls", -- Lua
        "marksman", -- Markdown
        "pyright", -- Python
    }
})

local lspconfig = require("lspconfig")
lspconfig.quick_lint_js.setup{}
lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
}
lspconfig.marksman.setup{}
lspconfig.pyright.setup{}

