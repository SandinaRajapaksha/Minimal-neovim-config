return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		require("mini.tabline").setup()
		-- require("mini.statusline").setup()
		require("mini.files").setup()
		require("mini.git").setup()
		require("mini.move").setup()
		require("mini.starter").setup()
		require("mini.indentscope").setup({ symbol = "▏" })
		vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Open explorer" })
	end,
}
