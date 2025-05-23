return {
  "echasnovski/mini.animate",
  enabled = false,
  event = "VeryLazy",
  opts = function(_, opts)
    opts.scroll = {
      enable = false,
    }
    opts.cursor = {
      enable = false,
      timing = require("mini.animate").gen_timing.cubic({ duration = 4 }),
    }
  end,
}
