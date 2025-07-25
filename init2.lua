-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.clipboard = "unnamedplus"
-- vim.opt.scrolloff = 8
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldenable = true
-- vim.opt.foldlevelstart = 0
-- vim.opt.foldnestmax = 1
-- vim.opt.cursorline = true
-- vim.opt.showmatch = true
-- vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<A-Up>", ":m .+1<CR>==", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<A-Down>", ":m .-2<CR>==", { noremap = true, silent = true })
-- vim.o.signcolumn = "yes"
-- vim.g.mapleader = " "

-- require("packer").startup(function()
-- 	use("wbthomason/packer.nvim")
-- 	use("nvim-lua/plenary.nvim")
-- 	use("nvim-telescope/telescope.nvim")
-- 	use("nvim-telescope/telescope-ui-select.nvim")
-- 	use("nvim-tree/nvim-web-devicons")
-- 	use("nvim-tree/nvim-tree.lua")
-- 	use("nvim-treesitter/nvim-treesitter")
-- 	use("nvim-treesitter/nvim-treesitter-textobjects")
-- 	use("williamboman/mason.nvim")
-- 	use("williamboman/mason-lspconfig.nvim")
-- 	use("neovim/nvim-lspconfig")
-- 	use("hrsh7th/nvim-cmp")
-- 	use("hrsh7th/cmp-nvim-lsp")
-- 	use("hrsh7th/cmp-buffer")
-- 	use("hrsh7th/cmp-path")
-- 	use("hrsh7th/vim-vsnip")
-- 	use("morhetz/gruvbox")
-- 	use("tpope/vim-commentary")
-- 	use("windwp/nvim-autopairs")
-- 	use("kana/vim-textobj-user")
-- 	use("kana/vim-textobj-function")
-- 	use("ray-x/lsp_signature.nvim")
-- 	use("wakatime/vim-wakatime")
-- 	use({
-- 		"nvim-neo-tree/neo-tree.nvim",
-- 		branch = "v3.x",
-- 		requires = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-tree/nvim-web-devicons",
-- 			"MunifTanjim/nui.nvim",
-- 		},
-- 	})
-- 	use("lukas-reineke/indent-blankline.nvim")
-- 	use({
-- 		"nvimtools/none-ls.nvim",
-- 		config = function() end,
-- 	})
-- 	use({
-- 		"catppuccin/nvim",
-- 		as = "catppuccin",
-- 		priority = 1000,
-- 	})
-- 	use({
-- 		"nvim-lualine/lualine.nvim",
-- 		requires = { "nvim-tree/nvim-web-devicons", opt = true },
-- 		config = function()
-- 			require("lualine").setup({
-- 				theme = "catppuccin",
-- 			})
-- 		end,
-- 	})
-- end)

-- require("mason").setup({})
-- require("mason-lspconfig").setup({
-- 	ensure_installed = { "clangd", "lua_ls", "ts_ls" },
-- })

-- local null_ls = require("null-ls")
-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.clang_format.with({
--             extra_args = { "--style", "{IndentWidth: 4}" }
--         }) 
-- 	},
-- })
-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- require("nvim-treesitter.configs").setup({
--     auto_install = true,
-- 	highlight = {
-- 		enable = true,
-- 	},
-- 	indent = {
-- 		enable = true,
-- 	},
-- })
-- vim.cmd("syntax on")
-- vim.opt.termguicolors = true
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

-- require("nvim-tree").setup({
-- 	disable_netrw = true,
-- 	hijack_netrw = true,
-- 	open_on_tab = false,
-- 	update_focused_file = { enable = true, update_cwd = true },
-- 	view = { width = 20 },
-- 	renderer = { icons = { show = { git = true, file = true, folder = true } } },
-- })

-- require("telescope").setup({
-- 	defaults = {
-- 		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
-- 		file_sorter = require("telescope.sorters").get_fuzzy_file,
-- 		prompt_prefix = " ",
-- 		selection_caret = "> ",
-- 		dynamic_preview_title = true,
-- 		layout_strategy = "horizontal",
-- 		layout_config = {
-- 			horizontal = {
-- 				width = 0.8,
-- 				preview_width = 0.6,
-- 			},
-- 			vertical = {
-- 				width = 0.8,
-- 			},
-- 		},
-- 		winblend = 0,
-- 	},
-- 	pickers = {
-- 		find_files = {
-- 			theme = "dropdown",
-- 		},
-- 	},
-- 	extensions = {
-- 		extensions = {
-- 			["ui-select"] = {
-- 				require("telescope.themes").get_dropdown({
-- 					-- even more opts
-- 				}),
-- 			},
-- 		},
-- 	},
-- })
-- require("telescope").load_extension("ui-select")

-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- require("nvim-web-devicons").setup()

-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		prefix = ">",
-- 		spacing = 4,
-- 	},
-- 	severity_sort = true,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	float = {
-- 		focusable = true,
-- 		border = "rounded",
-- 		source = "always",
-- 		header = "",
-- 		prefix = "",
-- 	},
-- 	severity_filter = {
-- 		source = function(diagnostic)
-- 			return diagnostic.source == vim.fn.expand("%:p")
-- 		end,
-- 	},
-- })
-- local signs = {
-- 	Error = "❗️",
-- 	Warn = "⚠️",
-- 	Info = "ℹ",
-- 	Hint = "💡",
-- }
-- for type, icon in pairs(signs) do
-- 	vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type, numhl = "" })
-- end

-- require("nvim-autopairs").setup({
-- 	disable_filetype = { "TelescopePrompt", "vim" },
-- })

-- local cmp = require("cmp")

-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["vsnip#anonymous"](args.body)
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<Tab>"] = cmp.mapping.select_next_item(),
-- 		["<S-Tab>"] = cmp.mapping.select_prev_item(),
-- 		["<CR>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				local entry = cmp.get_selected_entry()
-- 				if entry and entry.completion_item and entry.completion_item.kind == 3 then -- 3 is the kind for 'Function'
-- 					cmp.confirm({ select = true })
-- 					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("()<Left>", true, true, true), "n", true)
-- 				else
-- 					cmp.confirm({ select = true })
-- 				end
-- 			else
-- 				fallback()
-- 			end
-- 		end, { "i", "s" }),
-- 	},
-- 	sources = {
-- 		{ name = "nvim_lsp", max_item_count = 10 },
-- 		{ name = "buffer", max_item_count = 10 },
-- 		{ name = "path", max_item_count = 10 },
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered({
-- 			max_height = 5,
-- 		}),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- })

-- require("ibl").setup({
-- 	indent = {
-- 		char = "⎸", -- Change to preferred character, e.g., "┆", "⎸"
-- 	},
-- 	scope = {
-- 		enabled = true, -- Highlight the current scope
-- 		show_start = true, -- Show where the scope starts
-- 		show_end = true, -- Optionally show where the scope ends
-- 	},
-- 	exclude = {
-- 		filetypes = { "dashboard", "help", "packer", "NvimTree" },
-- 		buftypes = { "terminal" },
-- 	},
-- })

-- local lspconfig = require("lspconfig")
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
-- lspconfig.clangd.setup({
-- 	cmd = {
-- 		"clangd",
-- 		"--compile-commands-dir=.",
-- 	},
-- 	root_dir = function()
-- 		return vim.loop.cwd()
-- 	end,
-- })
-- lspconfig.lua_ls.setup({})
-- lspconfig.ts_ls.setup({})

-- local lsp_signature = require("lsp_signature")
-- lsp_signature.setup({
-- 	bind = true,
-- 	handler_opts = {
-- 		border = "rounded",
-- 	},
-- })
-- local catppuccin = require("catppuccin")
-- catppuccin.setup({
-- 	flavour = "mocha",
-- 	transparent_background = true,
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		telescope = true,
-- 		notify = true,
-- 		mini = true,
-- 		neogit = true,
-- 		treesitter = true,
-- 	},
-- })
-- vim.cmd.colorscheme("catppuccin")

-- require("lualine").setup({
-- 	options = {
-- 		theme = "catppuccin",
-- 		section_separators = { left = "", right = "" },
-- 		component_separators = { left = "", right = "" },
-- 		globalstatus = true,
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				function()
-- 					return " "
-- 				end,
-- 			},
-- 			"mode",
-- 		},
-- 		lualine_b = { "progress", "location" },
-- 		lualine_c = {
-- 			"%=",
-- 			{
-- 				"diagnostics",
-- 				sources = { "nvim_diagnostic" },
-- 				sections = { "error", "warn", "info", "hint" },
-- 				symbols = { error = "● ", warn = "● ", info = "● ", hint = "● " },
-- 				colored = true,
-- 				diagnostics_color = {
-- 					error = { fg = "#cf5555" },
-- 					warn = { fg = "#f1fa8c" },
-- 					info = { fg = "#8be9fd" },
-- 					hint = { fg = "#50fa7b" },
-- 				},
-- 				update_in_insert = false,
-- 			},
-- 			"%=",
-- 		},
-- 		lualine_x = { "filetype" },
-- 		lualine_y = { "filename" },
-- 		lualine_z = {
-- 			{
-- 				function()
-- 					local dir = vim.fn.expand("%:p:h")
-- 					return " " .. vim.fn.fnamemodify(dir, ":t")
-- 				end,
-- 				icon = "",
-- 			},
-- 		},
-- 	},
-- })
