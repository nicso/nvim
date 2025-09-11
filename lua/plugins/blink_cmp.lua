vim.g.ai_cmp = false

return {
  "Saghen/blink.cmp",
  dependencies = { "echasnovski/mini.snippets" },
  enabled = true,
  event = "InsertEnter",
  config = function()
    -- Initialize mini.snippets
    require("mini.snippets").setup()
    
    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "accept", "fallback" },
        ["<C-c>"] = { "cancel", "fallback" },
        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },
      },
    })
  end,
  opts = function(_, opts)
    -- ✅ Configuration simplifiée et corrigée
    local completion_enabled = true
    opts.snippets = { preset = "mini_snippets" }
    opts.sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    }
    -- Toggle pour la completion
    vim.keymap.set("n", "<leader>uk", function()
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
