return {
	"nvim-mini/mini.statusline",
	event = "VeryLazy",
	version = false,
	opts = {
		use_icons = vim.g.have_nerd_font,
	},
	init = function()
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_fileinfo = function()
			local bufcount = #vim.fn.getbufinfo({ buflisted = 1 })
			local filetype = vim.bo.filetype

			if filetype == "" then
				filetype = ""
			end
			return string.format("%s Bufs:%d", filetype, bufcount)
		end
	end,
}
