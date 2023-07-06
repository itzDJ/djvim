require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls", -- Bash
        "clangd", -- C/C++
        "jdtls", -- Java
        "quick_lint_js", -- JavaScript
        "lua_ls", -- Lua
        "marksman", -- Markdown
        "pyright", -- Python
    }
})

local lspconfig = require("lspconfig")
lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.jdtls.setup{}
lspconfig.quick_lint_js.setup{}
lspconfig.lua_ls.setup{}
lspconfig.marksman.setup{}
lspconfig.pyright.setup{}

