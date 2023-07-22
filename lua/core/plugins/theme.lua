-- If `echo $COLORTERM` returns 'truecolor\n' then require the theme

local handle = io.popen('echo $COLORTERM')
local colorterm = handle:read('*a')
handle:close()

if colorterm == 'truecolor\n' then
    require('rose-pine').setup({
        -- Clear background
        disable_background = true,
    })
    vim.cmd('colorscheme rose-pine-moon')
end
