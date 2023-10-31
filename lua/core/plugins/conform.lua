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
        java = { "prettier" },
    },
    -- If this is set, Conform will run the formatter on save.
    -- It will pass the table to conform.format().
    -- This can also be a function that returns the table.
    format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
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
