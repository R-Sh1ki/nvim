local dap = require('dap')
dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = {'-m', 'debugpy.adapter'}
}
dap.configurations.python = {
  {
    name = 'Launch file', 
    type = 'python',
    request = 'launch',
    program = '${file}',
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python3') == 1 then
        return cwd .. '/venv/bin/python3'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python3') == 1 then
        return cwd .. '/.venv/bin/python3'
      else
        return '/usr/bin/python3'
      end
    end,
    console = 'integratedTerminal',
  }
}

