return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = false },
			indent = { enable = false },
		})

		-- Patch broken directive incompatible with Neovim 0.12
		-- set-lang-from-info-string! calls node:range() which fails in 0.12
		vim.treesitter.query.add_directive(
			"set-lang-from-info-string!",
			function(match, _, bufnr, pred, metadata)
				local node = match[pred[2]]
				if not node then
					return
				end
				local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
				if ok and text then
					metadata["injection.language"] = text:lower()
				end
			end,
			{ force = true }
		)
	end,
}
