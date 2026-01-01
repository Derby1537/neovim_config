return {
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				-- per_filetype = {
				-- 	["html"] = {
				-- 		enable_close = false,
				-- 	},
				-- },
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"onsails/lspkind.nvim",
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			local luasnip = require("luasnip")

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				end
			end, { silent = true, desc = "Move to the next parameter" })

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { silent = true, desc = "Move to the previous parameter" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
						col_offset = 0,
						side_padding = 1,
					},
					documentation = {
						border = "single",
						winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
						{ name = "buffer" },
					}),
				formatting = {
					fields = { "kind", "abbr", "menu" },

					format = function(entry, vim_item)
						local kind = vim_item.kind
						local kind_hl_group = ("CmpItemKind%s"):format(kind)

						-- vim_item.kind_hl_group = ("%sIcon"):format(kind_hl_group)
						vim_item.kind_hl_group = kind_hl_group
						-- vim_item.kind = (" %s "):format(lspkind.symbolic)
						vim_item.kind = (" %s "):format(lspkind.symbolic(vim_item.kind, { mode = "symbol" }))

						local source = entry.source.name
						if source == "nvim_lsp" or source == "path" then
							vim_item.menu_hl_group = kind_hl_group
						else
							vim_item.menu_hl_group = "Comment"
						end
						vim_item.menu = kind

						if source == "buffer" then
							vim_item.menu_hl_group = nil
							vim_item.menu = nil
						end

						local half_win_width = math.floor(vim.api.nvim_win_get_width(0) * 0.5)
						if vim.api.nvim_strwidth(vim_item.abbr) > half_win_width then
							vim_item.abbr = ("%s…"):format(vim_item.abbr:sub(1, half_win_width))
						end

						if vim_item.menu then -- Add exta space to visually differentiate `abbr` and `menu`
							vim_item.abbr = ("%s "):format(vim_item.abbr)
						end


						local highlights_info = require("colorful-menu").cmp_highlights(entry)
						if highlights_info ~= nil then
							vim_item.abbr_hl_group = highlights_info.highlights
							vim_item.abbr = highlights_info.text
							-- vim_item.kind_hl_group = highlights_info.highlights

						end

						return vim_item
					end,
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			bind = true,
			floating_window = true,
			hint_enable = false,
			hint_prefix = "",

			handler_opts = {
				border = {
					{ "┌", "NormalFloat" },
					{ "─", "NormalFloat" },
					{ "┐", "NormalFloat" },
					{ "│", "NormalFloat" },
					{ "┘", "NormalFloat" },
					{ "", "NormalFloat" },
					{ "└", "NormalFloat" },
					{ "│", "NormalFloat" },
				},
			},
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{ "folke/neodev.nvim", opts = {} }
}
