return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function ()
            require("mason-lspconfig").setup {
                automatic_enable = false
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open documentation" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--compile-commands-dir=./Debug",
                    "--fallback-style=webkit",
                },
                root_dir = function()
                    return vim.loop.cwd()
                end,
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.java_language_server.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.dartls.setup({
                capabilities = capabilities,
                cmd = { "dart", "language-server", "--protocol=lsp" },  -- Comando per avviare il server Dart
                init_options = {
                    closingLabels = true,  -- Mostra etichette di chiusura per i widget Flutter
                    flutterOutline = true,  -- Abilita l'outline di Flutter
                    onlyAnalyzeProjectsWithOpenFiles = true,  -- Analizza solo i progetti con file aperti
                    suggestFromUnimportedLibraries = true,  -- Suggerisci simboli da librerie non importate
                },
                settings = {
                    dart = {
                        completeFunctionCalls = true,  -- Completa automaticamente le chiamate di funzione
                        showTodos = true,              -- Mostra i TODO nel codice
                        lineLength = 80,               -- Lunghezza massima della linea per la formattazione
                    },
                },
            })

            -- require("mason-lspconfig").setup_handlers({
            --     function(server_name)
            --         lspconfig[server_name].setup({
            --             capabilities = capabilities,
            --         })
            --     end,
            -- })

        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
}
