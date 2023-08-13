local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    "github/copilot.vim",

    "theprimeagen/harpoon",

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
        opts={}
    },

    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },

    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
}

require("lazy").setup(plugins)
