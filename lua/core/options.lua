-- (VIM) SETTINGS
local o = vim.opt

o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true
-- o.termguicolors = true
-- o.spell = true
-- o.spelllang = "en_us"

-- Rendering whitespaces
o.list = true
o.listchars = {
    space = "·", -- interpunct symbol
    tab = "-->", -- two dashes and a greater than symbol
}
