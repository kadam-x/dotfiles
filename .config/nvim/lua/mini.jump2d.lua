return {
	"echasnovski/mini.jump2d",
	version = false,
	config = function()
		local jump2d = require("mini.jump2d")

		jump2d.setup({
			mappings = {
				start_jumping = "",
			},
			view = {
				dim = true,
				n_steps_ahead = 2,
			},
		})

		vim.api.nvim_set_hl(0, "MiniJump2dSpot", {
			fg = "#FF9E3B",
			bold = true,
			underline = true,
		})

		vim.api.nvim_set_hl(0, "MiniJump2dDim", {
			fg = "#54546D",
		})

		vim.api.nvim_set_hl(0, "MiniJump2dSpotAhead", {
			fg = "#7FB4CA",
			bold = true,
		})

		vim.keymap.set({ "n", "x", "o" }, "f", function()
			jump2d.start(jump2d.builtin_opts.word_start)
		end)
	end,
}
