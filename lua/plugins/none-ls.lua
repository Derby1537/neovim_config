return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
                    filetypes = { "javascript", "typescript" }
                }),
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style", "{IndentWidth: 4}" },
				}),
                null_ls.builtins.diagnostics.rubocop,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
