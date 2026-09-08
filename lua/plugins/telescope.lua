return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>ff", "<cmd>Telescope live_grep<CR>", desc = "Grep in files" },
  },
}
