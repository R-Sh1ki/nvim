local dap, dapui = require("dap"), require("dapui")

dapui.setup({
})

-- use nvim-dap events to open and close debug windows automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap.repl.close()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap.repl.close()
  dapui.close()
end
dap.listeners.before.disconnect["dapui_config"] = function()
  dap.repl.close()
  dapui.close()
end
