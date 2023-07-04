-- PACKER
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins begin here
    use {
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
                -- dashboard.button( "e", "New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button("t", "Netrw", ":Explore<CR>"),
                dashboard.button("c", "Config" , ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "Quit NVIM" , ":qa<CR>"),
            }
            -- local handle = io.popen('fortune')
            -- local fortune = handle:read("*a")
            -- handle:close()
            -- dashboard.section.footer.val = fortune
            -- dashboard.config.opts.noautocmd = true
            -- vim.cmd[[autocmd User AlphaReady echo 'ready']]

            alpha.setup(dashboard.config)
        end
    }

    use 'github/copilot.vim'

    -- TODO: Add theme that works without true color
    use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'tpope/vim-commentary'

    use 'mg979/vim-visual-multi'

    -- use 'tpope/vim-fugitive' -- git

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
