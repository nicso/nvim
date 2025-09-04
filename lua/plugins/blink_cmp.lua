vim.g.ai_cmp = false

return {
  "Saghen/blink.cmp",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "accept", "fallback" },
      },
    })
  end,
  opts = function(_, opts)
    -- ✅ Configuration simplifiée et corrigée
    local completion_enabled = true

    -- Toggle pour la completion
    vim.keymap.set("n", "<leader>uc", function()
      completion_enabled = not completion_enabled
      vim.b.completion = completion_enabled
      vim.notify("Completion " .. (completion_enabled and "enabled" or "disabled"))
    end, { desc = "Toggle Completion" })

    opts.enabled = function()
      return vim.b.completion ~= false and completion_enabled
    end

    return opts
  end,
}
