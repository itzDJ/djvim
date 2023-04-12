-- If `echo $COLORTERM` returns 'truecolor\n' then require the theme

local handle = io.popen('echo $COLORTERM')
local colorterm = handle:read('*a')
handle:close()

if colorterm == 'truecolor\n' then
    require('github-theme').setup({
        theme_style = 'dark_default',
        transparent = true,
    })
end
