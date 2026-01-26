return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000, -- needs to load in first
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "amongus", -- Can be: modern, classic, minimal, powerline, simple, ghost, amongus
      options = {
        -- Show the source of the diagnostic
        show_source = false,
        -- Throttle diagnostic updates (ms)
        throttle = 20,
        -- Multilines
        multilines = {
          enabled = true,
          always_show = true,
          tabstop = 2,
        },
        -- Show all diagnostics on the cursor line
        multiple_diag_under_cursor = false,
        -- Enable diagnostic message on all lines
        overflow = {
          -- Overflow mode: "wrap" or "none"
          mode = "wrap",
        },
      },
    })

    -- Disable default virtual_text since it conflicts with tiny-inline-diagnostic
    vim.diagnostic.config({ virtual_text = false })
  end,
}
