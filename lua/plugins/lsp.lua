return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "github/copilot.vim",

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        "stevearc/conform.nvim",
    },

    config = function()
        -- Set up nvim-cmp.
        local cmp = require 'cmp'

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-1),
                ['<C-d>'] = cmp.mapping.scroll_docs(1),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local ls = require("luasnip")
        local s = ls.snippet
        local i = ls.insert_node
        local fmt = require("luasnip.extras.fmt").fmt

        ls.add_snippets("python", {
            s("main", fmt(
                [[
                #!/usr/bin/env python3


                def main():
                    {}


                if __name__ == "__main__":
                    main()
                ]], i(0)
            ))
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",   -- Lua
                "pyright",  -- Python
                "bashls",   -- Bash

                "tsserver", -- JavaScript / TypeScript
                "html",     -- HTML
                "cssls",    -- CSS
            },
            handlers = {
                -- Setup all servers with default settings
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                -- Setup lua language server with custom settings
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- If the formatters are not installed, install them
        local formatters = {
            "isort",
            "black",
            "prettier",
        }
        for _, formatter in pairs(formatters) do
            if vim.fn.executable(formatter) ~= 1 then
                vim.cmd("MasonInstall " .. formatter)
            end
        end

        require("conform").setup({
            -- Map of filetype to formatters
            formatters_by_ft = {
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },

                -- Prettier
                javascript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                markdown = { "prettier" },
            },
            -- If this is set, Conform will run the formatter on save.
            -- It will pass the table to conform.format().
            -- This can also be a function that returns the table.
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            -- If this is set, Conform will run the formatter asynchronously after save.
            -- It will pass the table to conform.format().
            -- This can also be a function that returns the table.
            format_after_save = {
                lsp_fallback = true,
            },
            -- Set the log level. Use `:ConformInfo` to see the location of the log file.
            log_level = vim.log.levels.ERROR,
            -- Conform will notify you when a formatter errors
            notify_on_error = true,
        })
    end
}
