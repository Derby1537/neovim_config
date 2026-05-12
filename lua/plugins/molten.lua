return {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    ft = { "python", "markdown" },
    init = function()
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_auto_open_output = true
        vim.g.molten_virt_text_output = true
    end,
    keys = {
        { "<leader>mi", ":MoltenInit<CR>",              desc = "Molten init" },
        { "<leader>me", ":MoltenEvaluateOperator<CR>",  desc = "Molten evaluate operator" },
        { "<leader>ml", ":MoltenEvaluateLine<CR>",      desc = "Molten evaluate line" },
        { "<leader>mc", ":MoltenReevaluateCell<CR>",    desc = "Molten reevaluate cell" },
        { "<leader>md", ":MoltenDelete<CR>",            desc = "Molten delete cell" },
        { "<leader>mo", ":MoltenShowOutput<CR>",        desc = "Molten show output" },
        { "<leader>mr", ":MoltenRestart!<CR>",          desc = "Molten restart kernel" },
    },
}
