local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require 'alpha'
            local dashboard = require 'alpha.themes.dashboard'
            dashboard.section.header.val = {
                [[     _  _       _           ]],
                [[  __| |(_)_   _(_)_ __ ___  ]],
                [[ / _` || \ \ / / | '_ ` _ \ ]],
                [[| (_| || |\ V /| | | | | | |]],
                [[ \__,_|/ | \_/ |_|_| |_| |_|]],
                [[     |__/]],
            }
            dashboard.section.buttons.val = {
                dashboard.button("t", "  Netrw", ":e .<CR>"),
                dashboard.button("ff", "  Find file", ":Telescope find_files<CR>"),
                dashboard.button("fg", "  Search in files", ":Telescope live_grep<CR>"),
                dashboard.button("c", "  Neovim config", ":e $MYVIMRC<CR>"),
                dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
            }
            dashboard.config.opts.noautocmd = true -- NOTE: Don't know if this is needed

            alpha.setup(dashboard.config)
        end
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    {
        "stevearc/conform.nvim",
        opts = {},
    },

    "github/copilot.vim",

    "projekt0n/github-nvim-theme",

    -- TODO Switch to v2
    "theprimeagen/harpoon",

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        opts = {},
    },

    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equivalent to setup({}) function
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
}

require("lazy").setup(plugins)
