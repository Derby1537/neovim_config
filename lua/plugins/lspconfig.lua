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
        config = function()
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

            -- Keymaps globali LSP
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open documentation" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

            -- clangd
            vim.lsp.config.clangd = {
                cmd = { "clangd", "--compile-commands-dir=.", "--fallback-style=webkit" },
                root_dir = vim.uv.cwd,
                capabilities = capabilities,
            }
            vim.lsp.start(vim.lsp.config.clangd)

            -- lua_ls
            vim.lsp.config.lua_ls = {
                cmd = { "lua-language-server" },
                capabilities = capabilities,
            }
            vim.lsp.start(vim.lsp.config.lua_ls)

            -- tsserver
            vim.lsp.config.tsserver = {
                cmd = { "typescript-language-server", "--stdio" },
                capabilities = capabilities,
            }
            vim.lsp.start(vim.lsp.config.tsserver)

            -- Java (jdtls)
            vim.lsp.config.jdtls = {
                cmd = { "jdtls" },
                capabilities = capabilities,
            }
            vim.lsp.start(vim.lsp.config.jdtls)

            -- cssls
            vim.lsp.config.cssls = {
                cmd = { "vscode-css-language-server", "--stdio" },
                capabilities = capabilities,
            }
            vim.lsp.start(vim.lsp.config.cssls)

            -- dartls
            vim.lsp.config.dartls = {
                cmd = { "dart", "language-server", "--protocol=lsp" },
                capabilities = capabilities,
                init_options = {
                    closingLabels = true,
                    flutterOutline = true,
                    onlyAnalyzeProjectsWithOpenFiles = true,
                    suggestFromUnimportedLibraries = true,
                },
                settings = {
                    dart = {
                        completeFunctionCalls = true,
                        showTodos = true,
                        lineLength = 80,
                    },
                },
            }
            vim.lsp.start(vim.lsp.config.dartls)
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
    },
}

