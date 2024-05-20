return {
    "projekt0n/github-nvim-theme",
    config = function()
        require("github-theme").setup({
            options = {
                transparent = true,
            },
        })

        -- If `echo $COLORTERM` returns 'truecolor\n' then require the theme
        if io.popen("echo $COLORTERM"):read("*a") == "truecolor\n" then
            vim.cmd("colorscheme github_dark")
        end
    end
}
