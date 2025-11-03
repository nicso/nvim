return {
  {
    "nvim-mini/mini.animate",
    version = "*",
    event = "VeryLazy",
    config = function()
      local animate = require("mini.animate")
      animate.setup({
        -- Cursor path animation - shows path when jumping between lines
        cursor = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },

        -- Scroll animation - DISABLED (using neoscroll.nvim instead)
        scroll = {
          enable = false,
        },

        -- Window resize animation
        resize = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        },

        -- Window open animation
        open = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },

        -- Window close animation
        close = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
      })
    end,
  },
}
