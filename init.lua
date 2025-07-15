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
vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_keymap("i", "jk", "<Esc>", {
    noremap = true,
    silent = true,
    desc = "Exit insert mode"
})
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", {
    noremap = true,
    silent = true,
    desc = "Exit insert mode while in terminal"
})
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", {
    noremap = true,
    silent = true,
    desc = "Move current line up one line"
})
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", {
    noremap = true,
    silent = true,
    desc = "Move current line down one line"
})
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", {
    noremap = true,
    silent = true,
    desc = "Move current selected lines up one line"
})
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", {
    noremap = true,
    silent = true,
    desc = "Move current selected lines down one line"
})
vim.api.nvim_set_keymap("n", "<C-S-k>", "yyP", {
    desc = "Copy and paste current line above"
})
vim.api.nvim_set_keymap("n", "<C-S-j>", "yyp", {
    desc = "Copy and paste current line below"
})
vim.api.nvim_set_keymap("v", "<C-S-j>", ":copy .", {
    noremap = true,
    desc = "copy and paste current line below"
})
vim.o.signcolumn = "yes"
vim.g.mapleader = " "
vim.o.colorcolumn = "80"

require("config.lazy")
