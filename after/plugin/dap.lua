local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local dap_python = require('dap-python')

dap_python.setup('~/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'
