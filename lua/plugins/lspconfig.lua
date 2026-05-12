return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open documentation" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--fallback-style=Google",
                    "--query-driver=/opt/homebrew/bin/g++-15",
                },
                capabilities = capabilities,
            })
            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("ts_ls", { capabilities = capabilities })
            vim.lsp.config("java_language_server", { capabilities = capabilities })
            vim.lsp.config("cssls", { capabilities = capabilities })
            -- vim.lsp.config("rust_analyzer", { capabilities = capabilities })
            vim.lsp.config("dartls", {
                capabilities = capabilities,
                cmd = { "dart", "language-server", "--protocol=lsp" },
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
            })
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        venvPath = vim.fn.getcwd(),
                        venv = "venv",
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            vim.lsp.config("prismals", { capabilities = capabilities })

            vim.lsp.config("sourcekit", {
                capabilities = capabilities,
                cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
                filetypes = { "swift", "objective-c", "objective-cpp" },
            })

            vim.lsp.enable({
                "clangd",
                "lua_ls",
                "ts_ls",
                "java_language_server",
                "cssls",
                "dartls",
                "pyright",
                "prismals",
                "sourcekit",
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters = {
                    prettier = {
                        prepend_args = { "--tab-width", "4" },
                    },
                    swift_format = {
                        prepend_args = { "--configuration", vim.fn.expand("~/.swift-format") },
                    },
                },
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    python = { "prettier" },
                    swift = { "swift_format" },
                },
            })

            vim.keymap.set("n", "<leader>fm", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Format file" })

            vim.keymap.set("v", "<leader>fm", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Format selection" })
        end,
    },
}
