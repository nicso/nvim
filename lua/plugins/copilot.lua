return {
  {
    "github/copilot.vim",
    enabled = true,
    config = function()
      -- Disable default tab mapping to avoid conflicts with completion
      vim.g.copilot_no_tab_map = true

      -- Custom accept mapping
      vim.keymap.set("i", "<C-e>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion",
      })

      -- Navigate suggestions
      vim.keymap.set("i", "<C-t>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
      vim.keymap.set("i", "<C-d>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
      vim.keymap.set("i", "<C-r>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })

      -- Toggle Copilot suggestions
      vim.keymap.set("n", "<leader>p", function()
        if vim.g.copilot_enabled == 0 then
          vim.cmd("Copilot enable")
          vim.notify("Copilot enabled", vim.log.levels.INFO)
        else
          vim.cmd("Copilot disable")
          vim.notify("Copilot disabled", vim.log.levels.INFO)
        end
      end, { desc = "Toggle Copilot suggestions" })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      window = {
        layout = "vertical",
        width = 0.4,
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- Custom keymaps for CopilotChat
      vim.keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
      vim.keymap.set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Explain selected code" })
      vim.keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Review selected code" })
      vim.keymap.set("v", "<leader>ci", ":CopilotChatFix<CR>", { desc = "Fix selected code" })
      vim.keymap.set("v", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
    end,
  },
}
