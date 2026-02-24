return {
	"sudo-tee/opencode.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	config = function()
		require("opencode").setup({})
	end,
	keys = {
		{ "<leader>ai", "<cmd>Opencode<cr>", desc = "Open OpenCode Chat" },
	},
}
