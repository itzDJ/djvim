require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls", -- bash
        "clangd", -- C/C++
        "html", -- HTML
        "jsonls", -- JSON
        "jdtls", -- Java
        "quick_lint_js", -- JavaScript
        "lua_ls", -- Lua
        "marksman", -- Markdown
        "pyright", -- Python
    }
})

require("lspconfig").bashls.setup{}
require("lspconfig").clangd.setup{}
require("lspconfig").html.setup{}
require("lspconfig").jsonls.setup{}
require("lspconfig").jdtls.setup{}
require("lspconfig").quick_lint_js.setup{}
require("lspconfig").lua_ls.setup{}
require("lspconfig").marksman.setup{}
require("lspconfig").pyright.setup{}
