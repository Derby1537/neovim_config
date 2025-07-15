return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
		-- Enable folds by default
		vim.o.foldenable = true
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.cmd([[
            augroup PersistentFolds
            autocmd!
            autocmd BufWinLeave *.* mkview
            autocmd BufWinEnter *.* silent! loadview
            augroup END
        ]])
	end,
}
