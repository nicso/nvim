vim.g.ai_cmp = false

return {
  "Saghen/blink.cmp",
  event = "InsertEnter", -- ou "VeryLazy" si tu préfères un chargement encore plus tardif
  config = function()
    require("blink.cmp").setup({})
  end,
  opts = function(_, opts)
    vim.b.completion = true
    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.b.completion
      end,
      set = function(state)
        vim.b.completion = state
      end,
    }):map("<leader>uk")
    opts.enabled = function()
      return vim.b.completion ~= true
    end
    return opts
  end,
}
