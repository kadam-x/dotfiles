return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")

			require("dapui").setup({})
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			dap_python.setup("python3")

			-- Breakpoint Icons
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignWarn", linehl = "Visual" })

			-- Automatically open/close DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			--- Keymaps with Descriptions for Which-Key ---
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
			end

			map("n", "<leader>db", dap.toggle_breakpoint, "Debug: Toggle Breakpoint")
			map("n", "<leader>dc", dap.continue, "Debug: Start/Continue")
			map("n", "<leader>do", dap.step_over, "Debug: Step Over")
			map("n", "<leader>di", dap.step_into, "Debug: Step Into")
			map("n", "<leader>dO", dap.step_out, "Debug: Step Out")
			map("n", "<leader>dq", dap.terminate, "Debug: Terminate")
			map("n", "<leader>du", dapui.toggle, "Debug: Toggle UI")
		end,
	},
}
