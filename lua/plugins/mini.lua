return { 'nvim-mini/mini.nvim', version = '*',
config = function () 
    require("mini.pairs").setup() 
    require("mini.tabline").setup() 
    require("mini.statusline").setup() 
    require("mini.files").setup() 
    vim.keymap.set("n","<leader>e",":lua MiniFiles.open()<CR>", {desc = "Open explorer"})
end 
}

