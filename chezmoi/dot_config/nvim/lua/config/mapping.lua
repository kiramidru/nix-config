vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard (visual)" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "Yank to clipboard until end of line" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste after cursor from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before cursor from clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste after selection from clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "Paste before selection from clipboard" })
