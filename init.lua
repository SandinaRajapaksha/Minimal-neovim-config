-- starting tweaks
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- importing options , keymaps and autocmds
require("config.options")
require("config.keymaps")
require("config.lazy")

-- color scheme set
vim.cmd.colorscheme("moonfly") 
