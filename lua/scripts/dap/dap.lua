local dap = require("dap")
vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointRejected", {text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "", texthl = "LspDiagnosticsSignInformation", linehl = "", numhl = ""})

require('scripts.dap.config.cpp')
require('scripts.dap.config.python')
