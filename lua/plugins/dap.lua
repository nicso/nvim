return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui" },
  config = function()
    local dap = require("dap")

    dap.adapters.godot = {
      type = "server",
      host = "127.0.0.1",
      port = 6007,
    }

    dap.configurations.gdscript = {
      {
        type = "godot",
        request = "attach",
        name = "attach to scene",
        project = "${workspaceFolder}",
      },
    }

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })

    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
