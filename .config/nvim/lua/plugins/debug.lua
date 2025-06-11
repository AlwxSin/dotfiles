return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")
		local widg = require("dap.ui.widgets")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F1>", function()
			dap.continue()
		end, { desc = "dap continue" })
		vim.keymap.set("n", "<F2>", function()
			dap.step_over()
		end, { desc = "dap step over (next)" })
		vim.keymap.set("n", "<F3>", function()
			dap.step_into()
		end, { desc = "dap step into" })
		vim.keymap.set("n", "<F4>", function()
			dap.step_out()
		end, { desc = "dap step out" })
		vim.keymap.set("n", "<Leader>dt", function()
			dap.toggle_breakpoint()
		end, { desc = "dap toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dlp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "dap set breakpoint" })
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end, { desc = "dap repl open" })
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end, { desc = "dap run last" })
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			widg.hover()
		end, { desc = "dap widget hover" })
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			widg.preview()
		end, { desc = "dap widget preview" })
		vim.keymap.set("n", "<Leader>df", function()
			widg.centered_float(widg.frames)
		end, { desc = "dap widget frames" })
		vim.keymap.set("n", "<Leader>ds", function()
			widg.centered_float(widg.scopes)
		end, { desc = "dap widget scopes" })

		-- vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

        -- add loaded envs to each configuration
        -- so we don't need to pass them manually
        local go_configs = dap.configurations.go or {}
        local envs = vim.fn.environ()

        for _, config in ipairs(go_configs) do
            if config.env then
                for k, v in pairs(envs) do
                    config.env[k] = v
                end
            else
                config.env = envs
            end
        end

        dap.configurations.go = go_configs

	end,
}
