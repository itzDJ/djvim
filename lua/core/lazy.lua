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
        -- alpha-nvim might have to be loaded first
        "goolord/alpha-nvim",
        config = function ()
            local alpha = require'alpha'
            local dashboard = require'alpha.themes.dashboard'
            dashboard.section.header.val = {
                [[  _______         __     ____    ____  __  .___  ___. ]],
                [[ |       \       |  |    \   \  /   / |  | |   \/   | ]],
                [[ |  .--.  |      |  |     \   \/   /  |  | |  \  /  | ]],
                [[ |  |  |  |.--.  |  |      \      /   |  | |  |\/|  | ]],
                [[ |  '--'  ||  `--'  |       \    /    |  | |  |  |  | ]],
                [[ |_______/  \______/         \__/     |__| |__|  |__| ]],
            }
            dashboard.section.buttons.val = {
                dashboard.button("n", "New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button("t", "Netrw", ":Explore<CR>"),
                dashboard.button("c", "Config" , ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "Quit" , ":qa<CR>"),
            }

            alpha.setup(dashboard.config)
        end
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    "github/copilot.vim",

    "theprimeagen/harpoon",

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
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
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
