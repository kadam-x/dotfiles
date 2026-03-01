vim.opt.showmode = false

local function git_info()
	local cwd = vim.fn.expand("%:p:h")
	local branch = vim.fn.system("git -C " .. cwd .. " branch --show-current 2>/dev/null"):gsub("\n", "")
	if branch == "" then
		return ""
	end

	local status = vim.fn.system("git -C " .. cwd .. " status --porcelain 2>/dev/null")
	local added, modified, deleted = 0, 0, 0
	for line in status:gmatch("[^\n]+") do
		local xy = line:sub(1, 2)
		if xy:match("[MARC]") then
			added = added + 1
		elseif xy:match("M") then
			modified = modified + 1
		elseif xy:match("[D]") then
			deleted = deleted + 1
		end
		if xy:sub(2, 2) == "M" then
			modified = modified + 1
		elseif xy:sub(2, 2) == "D" then
			deleted = deleted + 1
		end
	end

	local parts = { branch }
	if added > 0 then
		table.insert(parts, "+" .. added)
	end
	if modified > 0 then
		table.insert(parts, "~" .. modified)
	end
	if deleted > 0 then
		table.insert(parts, "-" .. deleted)
	end

	return table.concat(parts, " ")
end

local function statusline()
	local mode_map = {
		n = { "NORMAL", "#888888", "#111111" },
		i = { "INSERT", "#111111", "#9c8d7e" },
		v = { "VISUAL", "#111111", "#888888" },
		V = { "VISUAL LINE", "#111111", "#888888" },
		["\22"] = { "VISUAL BLOCK", "#111111", "#888888" },
		c = { "COMMAND", "#111111", "#888888" },
		R = { "REPLACE", "#111111", "#888888" },
		t = { "TERMINAL", "#111111", "#888888" },
		s = { "SELECT", "#111111", "#888888" },
		S = { "SELECT LINE", "#111111", "#888888" },
	}
	local m = mode_map[vim.fn.mode()] or { vim.fn.mode(), "#111111", "#888888" }
	local mode_label, mode_fg, mode_bg = m[1], m[2], m[3]

	vim.api.nvim_set_hl(0, "StatuslineMode", { fg = mode_fg, bg = mode_bg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineBase", { fg = "#888888", bg = "#111111" })
	vim.api.nvim_set_hl(0, "StatuslineGit", { fg = "#9c8d7e", bg = "#111111" })

	local bufcount = #vim.fn.getbufinfo({ buflisted = 1 })
	local filetype = vim.bo.filetype ~= "" and vim.bo.filetype or ""
	local filename = vim.fn.expand("%:~:.")
	local modified = vim.bo.modified and " [+]" or ""
	local location = string.format("%2d:%-2d", vim.fn.line("."), vim.fn.col("."))
	local git = git_info()

	return table.concat({
		"%#StatuslineMode# ",
		mode_label,
		" ",
		git ~= "" and ("%#StatuslineGit# " .. git .. " ") or "",
		"%#StatuslineBase# ",
		filename,
		modified,
		" ",
		"%=",
		filetype ~= "" and (filetype .. " ") or "",
		string.format("Bufs:%d ", bufcount),
		location,
		" ",
	})
end

vim.opt.statusline = "%!v:lua.require('statusline').get()"

return {
	get = statusline,
}
