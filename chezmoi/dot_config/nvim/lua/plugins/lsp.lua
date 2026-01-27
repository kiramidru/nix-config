return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local servers = { "elixirls", "gopls", "lua_ls", "nil_ls", "pyright", "tailwindcss", "ts_ls", "rust_analyzer" }

        local custom_servers = {
            elixirls = {
                capabilities = capabilities,
                settings = {
                    elixirLS = {
                        dialyzerEnabled = false,
                        fetchDeps = false,
                    },
                },
            },
            rust_analyzer = {
                capabilities = capabilities,
                cmd = { "rust-analyzer" },
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        checkOnSave = {
                            enable = true,
                            command = "clippy",
                        },
                        procMacro = { enable = true },
                    },
                },
            },
        }

        for _, server in ipairs(servers) do
            local config = custom_servers[server] or { capabilities = capabilities }
            vim.lsp.config(server, config)
        end
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                for _, server in ipairs(servers) do
                    vim.lsp.enable(server)
                end
            end,
        })

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.implementation, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
}
