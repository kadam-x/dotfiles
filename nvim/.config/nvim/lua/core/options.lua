vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable command history
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "q/", "<nop>")
vim.keymap.set("n", "q?", "<nop>")

-- Delete/change without yanking (send to black hole register)
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete to EOL without yanking" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "Change to EOL without yanking" })

-- cut and yank(whole line)
vim.keymap.set("n", "D", "dd", { desc = "Cut line (yank + delete)" })

-- Paste without overwriting clipboard
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking selection" })

-- V = select all
vim.keymap.set("n", "V", "ggVG", { desc = "Select all" })

-- tabs
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.termguicolors = true

-- Normal Mode: Highlight line number only
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "InsertLeave" }, {
	callback = function()
		vim.opt.cursorline = true
		vim.opt.cursorlineopt = "number"
	end,
})

-- Insert Mode: Highlight the entire line
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.cursorline = true
		vim.opt.cursorlineopt = "both" -- Highlights both number and line
	end,
})

vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Always hard wrap at 80 characters in every file
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = function()
		vim.opt_local.textwidth = 80
		vim.opt_local.formatoptions:append("t") -- wrap text
		vim.opt_local.smartindent = false
	end,
})

-- backup and undo
vim.opt.ruler = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.inccommand = "split"

-- UI
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

-- folding (for nvim-ufo)
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"

-- prettier hints
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- nicer diagnostics
-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		prefix = "●", -- or "■", "▎", "»"
-- 		spacing = 4,
-- 	},
-- 	float = {
-- 		border = "rounded",
-- 		source = true, -- shows "eslint: ..." etc.
-- 	},
-- 	signs = true,
-- 	underline = true,
-- 	update_in_insert = false, -- less noisy while typing
-- 	severity_sort = true,
-- })
--
-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
