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
				position = "float",
				popup = {
					size = { height = "80%", width = "50%" },
					position = "50%",
					border = {
						style = "rounded",
						highlight = "NeoTreeFloatBorder",
					},
				},
			},
			win_options = {
				statusline = "",
				winblend = 0,
				winhighlight = "Normal:NeoTreeNormal,NormalFloat:NeoTreeNormal,FloatBorder:NeoTreeFloatBorder",
			},
		})
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "FloatBorder" })
		vim.keymap.set("n", "<C-n>", ":Neotree float reveal<CR>", { desc = "Toggle neo-tree float" })
	end,
}
