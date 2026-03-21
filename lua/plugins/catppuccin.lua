return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})

		vim.cmd.colorscheme("catppuccin-frappe")

		-- Popup completion
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#313244", bold = true })
		vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#45475a" })
		vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#181825" })

		-- Hover e floating windows
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#45475a" })

		-- Telescope
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1e1e2e", fg = "#45475a" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#1e1e2e", fg = "#45475a" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#1e1e2e", fg = "#45475a" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#1e1e2e", fg = "#45475a" })
	end,
}
