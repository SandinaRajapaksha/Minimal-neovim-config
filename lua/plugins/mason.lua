return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"eslint",
				"pyre",
			},
			-- auto calls vim.lsp.enable() for installed servers
			automatic_enable = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Only put custom settings here. Defaults come from nvim-lspconfig itself.
			-- Example:
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			-- No need to call vim.lsp.enable() - mason-lspconfig does it for you
			-- because automatic_enable = true
		end,
	},
}
