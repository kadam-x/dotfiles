return {
	"mcchrish/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.zenbones_darkness = "stark"
		vim.cmd("colorscheme zenbones")

		local h = vim.api.nvim_set_hl
		local bg = "#000000"
		local accent = "#9c8d7e"

		h(0, "Normal", { bg = bg })
		h(0, "NormalFloat", { bg = bg })
		h(0, "FloatBorder", { bg = bg })
		h(0, "NvimTreeNormal", { bg = bg })
		h(0, "ColorColumn", { bg = bg })
		h(0, "SignColumn", { bg = bg })
		h(0, "Folded", { bg = bg })
		h(0, "LineNr", { bg = bg })
		h(0, "LineNrAbove", { bg = bg })
		h(0, "LineNrBelow", { bg = bg })
		h(0, "CursorLineNr", { bg = bg })
		h(0, "FoldColumn", { bg = bg })
		h(0, "DiffAdd", { bg = bg })
		h(0, "DiffChange", { bg = bg })
		h(0, "DiffDelete", { bg = bg })
		h(0, "DiffText", { bg = bg })
		h(0, "GitSignsAdd", { bg = bg })
		h(0, "GitSignsChange", { bg = bg })
		h(0, "GitSignsDelete", { bg = bg })
		h(0, "DiagnosticSignWarn", { bg = bg })
		h(0, "DiagnosticSignHint", { bg = bg })
		h(0, "DiagnosticSignError", { bg = bg })
		h(0, "DiagnosticSignInfo", { bg = bg })
		h(0, "IncSearch", { fg = bg, bg = accent })
		h(0, "Search", { fg = bg, bg = accent })
		-- accent overrides
		h(0, "StatusLine", { fg = bg, bg = accent })
		h(0, "StatusLineNC", { fg = accent, bg = bg })
		h(0, "TabLine", { fg = accent, bg = bg })
		h(0, "TabLineSel", { fg = bg, bg = accent })
		h(0, "TabLineFill", { fg = accent, bg = bg })
		h(0, "WinSeparator", { fg = accent, bg = bg })
		h(0, "VertSplit", { fg = accent, bg = bg })
		h(0, "BufferCurrentMod", { fg = "#6b5a4e", bg = accent })
		h(0, "BufferInactiveMod", { fg = "#6b5a4e", bg = bg })
		h(0, "iCursor", { fg = "#000000", bg = "#ffffff" })
	end,
}
