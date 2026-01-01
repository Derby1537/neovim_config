return {
    "fouladi/toggle-overlength.nvim",
    config = function()
        require("toggle-overlength").setup({
            column_length = 80, -- Set column length to 80
            ctermbg = "red", -- Set terminal background color to red
            guibg = "#ff0000", -- Set GUI background color to red
        })
    end,
}
