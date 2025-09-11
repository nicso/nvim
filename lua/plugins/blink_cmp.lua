vim.g.ai_cmp = false

return {
  "Saghen/blink.cmp",
  dependencies = { 
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets"
  },
  enabled = true,
  event = "InsertEnter",
  opts = {
    snippets = { 
      preset = "luasnip",
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
    },
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
  },
  config = function(_, opts)
    local luasnip = require("luasnip")
    
    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    
    -- Make TypeScript use JavaScript snippets too
    luasnip.filetype_extend("typescript", { "javascript" })
    luasnip.filetype_extend("typescriptreact", { "javascript", "typescript" })
    
    -- Setup completion toggle
    local completion_enabled = true
    vim.keymap.set("n", "<leader>uk", function()
      completion_enabled = not completion_enabled
      vim.b.completion = completion_enabled
      vim.notify("Completion " .. (completion_enabled and "enabled" or "disabled"))
    end, { desc = "Toggle Completion" })

    opts.enabled = function()
      return vim.b.completion ~= false and completion_enabled
    end
    
    require("blink.cmp").setup(opts)
  end,
}
