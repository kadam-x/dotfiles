return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
 ██████╗███╗   ██╗███████╗███████╗██╗   ██╗██╗███╗   ███╗
██╔════╝████╗  ██║██╔════╝╚══███╔╝██║   ██║██║████╗ ████║
╚█████╗ ██╔██╗ ██║█████╗    ███╔╝ ██║   ██║██║██╔████╔██║
 ╚═══██╗██║╚██╗██║██╔══╝   ███╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝██║ ╚████║███████╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		image = { enabled = false },
		indent = { enabled = true },
		lazygit = { enabled = true },
	},
	keys = {
		-- Lazygit
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},

		-- Notifications
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},

		-- Terminal (multiple keybinds for convenience)
		{
			"<A-h>",
			function()
				Snacks.terminal.toggle(nil, { win = { position = "bottom" } })
			end,
			desc = "Toggle Horizontal Terminal",
			mode = { "n", "t" },
		},
		-- Picker keymaps
		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Find Word",
			mode = { "n", "x" },
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep in Buffers",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps({
					confirm = "edit",
				})
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Neovim Config Files",
		},
		{
			"<leader>x",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
	},
}
