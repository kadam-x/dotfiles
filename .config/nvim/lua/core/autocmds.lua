vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 1 then
			local arg = vim.fn.argv(0)
			if vim.fn.isdirectory(arg) == 1 then
				vim.defer_fn(function()
					pcall(vim.api.nvim_buf_delete, 0, { force = true })
					require("snacks").dashboard.open()
				end, 10) -- 10ms delay
			end
		end
	end,
})
