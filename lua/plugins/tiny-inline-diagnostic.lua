return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = { "BufReadPre", "BufNewFile" },
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			options = {
				show_all_diags_on_cursorline = true,
				multilines = {
					enabled = true,
					always_show = true,
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
