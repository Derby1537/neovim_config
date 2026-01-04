vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldenable = true
-- vim.opt.foldlevelstart = 0
-- vim.opt.foldnestmax = 1
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.cmd.colorscheme("catppuccin-frappe")
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.opt.termguicolors = true

vim.api.nvim_set_keymap("i", "jk", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Exit insert mode",
})
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", {
	noremap = true,
	silent = true,
	desc = "Exit insert mode while in terminal",
})
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", {
	noremap = true,
	silent = true,
	desc = "Move current line up one line",
})
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", {
	noremap = true,
	silent = true,
	desc = "Move current line down one line",
})
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move current selected lines up one line",
})
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", {
	noremap = true,
	silent = true,
	desc = "Move current selected lines down one line",
})
vim.api.nvim_set_keymap("n", "<C-S-k>", "yyP", {
	desc = "Copy and paste current line above",
})
vim.api.nvim_set_keymap("n", "<C-S-j>", "yyp", {
	desc = "Copy and paste current line below",
})
vim.api.nvim_set_keymap("v", "<C-S-j>", ":copy .", {
	noremap = true,
	desc = "copy and paste current line below",
})

-- Disable arrows
vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>")

-- Disable mouse
vim.opt.mouse = "a"
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelUp>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelDown>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelLeft>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelRight>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<LeftMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<RightMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<MiddleMouse>", "<Nop>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.g.rustaceanvim = {
	server = {
		cmd = function()
			local mason_registry = require("mason-registry")
			if mason_registry.is_installed("rust-analyzer") then
				-- This may need to be tweaked depending on the operating system.
				local ra = mason_registry.get_package("rust-analyzer")
				local ra_filename = ra:get_receipt():get().links.bin["rust-analyzer"]
				return { ("%s/%s"):format(ra:get_install_path(), ra_filename or "rust-analyzer") }
			else
				-- global installation
				return { "rust-analyzer" }
			end
		end,
	},
}

require("config.lazy")
