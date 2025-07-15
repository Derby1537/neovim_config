return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					{
						function()
							return " "
						end,
					},
					"mode",
				},
				lualine_b = { "progress", "location" },
				lualine_c = {
					"%=",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = "● ", warn = "● ", info = "● ", hint = "● " },
						colored = true,
						diagnostics_color = {
							error = { fg = "#cf5555" },
							warn = { fg = "#f1fa8c" },
							info = { fg = "#8be9fd" },
							hint = { fg = "#50fa7b" },
						},
						update_in_insert = false,
					},
					"%=",
				},
				lualine_x = { "filetype" },
				lualine_y = { "filename" },
				lualine_z = {
					{
						function()
							local dir = vim.fn.expand("%:p:h")
							return " " .. vim.fn.fnamemodify(dir, ":t")
						end,
						icon = "",
					},
				},
			},

			-- sections = {
			--     lualine_a = {
			--         {
			--             function()
			--                 return ""
			--             end,
			--         },
			--         'mode'
			--     },
			--     lualine_b = {'branch', 'diff', 'diagnostics'},
			--     lualine_c = {'filename'},
			--     lualine_x = {'encoding', 'fileformat', 'filetype'},
			--     lualine_y = {'progress'},
			--     lualine_z = {'location'}
			-- },
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
