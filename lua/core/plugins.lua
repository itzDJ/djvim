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
    -- alpha-nvim

    "github/copilot.vim",

    -- TODO: Add theme that works without true color
    "projekt0n/github-nvim-theme",

    { "nvim-lualine/lualine.nvim", dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } } },

    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    "tpope/vim-commentary",

    "mg979/vim-visual-multi",

    -- "tpope/vim-fugitive",
}

require("lazy").setup(plugins)
