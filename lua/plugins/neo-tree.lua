return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30, -- Adjust this value to set your desired width
			},
			win_options = {
				statusline = "", -- Disables the status line in Neo-tree
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", { desc = "Toggle neo-tree" })
	end,
}
