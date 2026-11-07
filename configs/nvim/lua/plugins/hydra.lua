return {
  "nvimtools/hydra.nvim",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local Hydra = require("hydra")
    local dap = require("dap")

    local function conditional_breakpoint()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end

    Hydra({
      name = "Debug Hydra Mode",
 --      hint = [[
 -- [c] continue    [i] step into   [o] step over   [u] step out
 -- [b] breakpoint  [t] terminate   [l] repl        [q] quit/exit
 --      ]],
      config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
          type = "window",
          position = "bottom-right",
        },
      },
      mode = "n",
      body = "<leader>dh", -- Trigger prefix: Space + d + h
      heads = {
        { "c", dap.continue, { desc = "continue" } },
        { "i", dap.step_into, { desc = "step into" } },
        { "o", dap.step_over, { desc = "step over" } },
        { "u", dap.step_out, { desc = "step out" } },
        { "b", dap.toggle_breakpoint, { desc = "breakpoint" } },
        { "B", conditional_breakpoint, { desc = "conditional breakpoint" } },
        { "t", dap.terminate, { exit = true, desc = "terminate" } },
        { "l", dap.repl.toggle, { desc = "repl" } },
        { "q", nil, { exit = true, desc = "exit" } },
      },
    })
  end,
}
