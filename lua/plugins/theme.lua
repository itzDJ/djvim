return {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
        require("github-theme").setup({
            options = { transparent = true },
        })

        -- If `echo $COLORTERM` returns 'truecolor\n' then enable the theme
        if io.popen("echo $COLORTERM"):read("*a") == "truecolor\n" then
            vim.cmd("colorscheme github_dark")
        end
    end,
}
