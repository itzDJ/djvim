-- If `echo $COLORTERM` returns 'truecolor\n' then require the theme

if io.popen("echo $COLORTERM"):read("*a") == "truecolor\n" then
    require("github-theme").setup({
        options = {
            transparent = true,
        },
    })
    vim.cmd("colorscheme github_dark")
end
