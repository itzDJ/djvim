local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "tsserver", -- JavaScript
        "lua_ls",   -- Lua
        "pylsp",    -- Python
    },
    handlers = {
        lsp_zero.default_setup,
    }
})

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
})

lsp_zero.setup_servers({
    "tsserver",
    "pylsp",
})
