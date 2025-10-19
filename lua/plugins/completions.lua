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
                        border = "rounded",
                        max_height = 10,
                    },
                    documentation = {
                        border = "rounded",
                        max_height = 10,
                        max_width = 60,
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
                    format = function(entry, vim_item)
                        local highlights_info = require("colorful-menu").cmp_highlights(entry)

                        -- highlight_info is nil means we are missing the ts parser, it's
                        -- better to fallback to use default `vim_item.abbr`. What this plugin
                        -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
                        if highlights_info ~= nil then
                            vim_item.abbr_hl_group = highlights_info.highlights
                            vim_item.abbr = highlights_info.text
                        end

                        return vim_item
                    end,
                },
            })
        end,
    },
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require("lsp_signature").setup(opts)
	-- 	end,
	-- },
}
