return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    direction = "float",
    close_on_exit = true,
    -- This is what lets it close FROM terminal mode
    open_mapping = [[<C-/>]],
    float_opts = { border = "curved" },
  },
  keys = {
    -- We map both <C-/> and <C-_> because your terminal sends <C-_>
    { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "i", "t" } },
    { "<C-_>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "i", "t" } },
  },
}
