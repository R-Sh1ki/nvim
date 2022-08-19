local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
	settings = {
		Lua = {
      runtime = {
        version = "LuaJIT",   -- version of the lua
        path = runtime_path,  -- lua path
      },
			diagnostics = {
				globals = { "vim" },  -- recognize the `vim` as global
			},
			workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
			},
      telemetry = {
        enable = false,
      },
		},
	},
}
