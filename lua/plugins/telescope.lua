return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Telescope undo" })
            vim.keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Telescope neoclip" })
            vim.keymap.set("n", "<leader>b", ":bn<CR>", { desc = "next buffer" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                    ["undo"] = {

                    }
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                },
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        "dist",
                        "build",
                        "migration"
                    }
                }
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("undo")
        end,
    },
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            -- you'll need at least one of these
            {'nvim-telescope/telescope.nvim'},
            {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    }
}
