return {
	"neovim/nvim-lspconfig",

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.diagnostic.config({
			virtual_text = { prefix = "●", spacing = 4 },
			underline = true,
			signs = true,
			update_in_insert = false,
		})

		local servers = { "elixirls", "gopls", "lua_ls", "nil_ls", "pyright", "tailwindcss", "ts_ls", "rust_analyzer" }

		local custom_servers = {
			elixirls = {
				settings = {
					elixirLS = { dialyzerEnabled = false, fetchDeps = false },
				},
			},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = { enable = true, command = "clippy" },
						procMacro = { enable = true },
					},
				},
			},
		}

		for _, server in ipairs(servers) do
			local config = custom_servers[server] or {}
			config.capabilities = capabilities

			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.implementation, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
}
