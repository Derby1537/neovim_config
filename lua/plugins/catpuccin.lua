return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- vim.cmd("colorscheme onedark")
		-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		-- Popup completion background (Catppuccin Frappe)
		vim.api.nvim_set_hl(0, "Pmenu", {
			bg = "#1e1e2e", -- leggermente più scuro
		})
		vim.api.nvim_set_hl(0, "PmenuSel", {
			bg = "#313244", -- selezione
			bold = true,
		})
		vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#45475a" })
		vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#181825" })
	end,
}
