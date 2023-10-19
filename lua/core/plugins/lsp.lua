local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false -- Needed to force the default mappings
    })
    lsp_zero.buffer_autoformat()  -- TODO Is this needed after adding conform?
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",   -- Lua
        "pyright",  -- Python
        "tsserver", -- JavaScript / TypeScript
        "jdtls",    -- Java (requires JDK 17 as JAVA_HOME)
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
        },
    },
})

-- Not sure if this is needed
lsp_zero.setup_servers({
    "pyright",
    "tsserver",
    "jdtls",
})

-- Custom function to install formatters (prettier)
vim.api.nvim_create_user_command("InstallFormatters", function()
    local formatters = {
        "isort",
        "black",
        "prettier",
    }

    for _, formatter in pairs(formatters) do
        vim.cmd("MasonInstall " .. formatter)
    end
end, { nargs = "*", desc = "Install formatters through mason" })

-- If prettier is not installed, install formatters
if vim.fn.executable("prettier") ~= 1 then
    vim.cmd("InstallFormatters")
end
