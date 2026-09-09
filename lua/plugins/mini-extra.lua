-- lazy.nvim spec - put maps inside config so plugins are loaded
return {
	"nvim-mini/mini.extra",
	dependencies = { "nvim-mini/mini.pick" },
	config = function()
		require("mini.extra").setup()
		local extra = require("mini.extra")

		vim.keymap.set("n", "gd", function()
			extra.pickers.lsp({ scope = "definition" })
		end, { desc = "LSP definition" })

		vim.keymap.set("n", "gr", function()
			extra.pickers.lsp({ scope = "references" })
		end, { desc = "LSP references" })

		vim.keymap.set("n", "<leader>ss", function()
			extra.pickers.lsp({ scope = "document_symbol" })
		end, { desc = "Document symbols" })

		vim.keymap.set("n", "<leader>sS", function()
			extra.pickers.lsp({ scope = "workspace_symbol" })
		end, { desc = "Workspace symbols" })

		-- use different key for live
		vim.keymap.set("n", "<leader>sW", function()
			extra.pickers.lsp({ scope = "workspace_symbol_live" })
		end, { desc = "Workspace symbols live" })
	end,
}
