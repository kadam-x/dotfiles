return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
		local map = vim.keymap.set
		-- Normal mode buffer cycling
		map("n", "<Tab>", "<Cmd>BufferNext<CR>", { silent = true })
		map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { silent = true })
	end,
	opts = {},
}
