return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  enable = false,
  opts = {
    mappings = {}, -- Mappings personnalisés définis via keys
    hide_cursor = false,
    stop_eof = true,
    use_local_scrolloff = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = "quadratic",
  },
  keys = function()
    local neoscroll = require("neoscroll")

    -- Fonction helper pour scroll + center
    local function scroll_and_center(scroll_func, duration)
      return function()
        scroll_func({
          duration = duration or 250,
          post_hook = function()
            neoscroll.zz({ half_win_duration = 100 })
          end,
        })
      end
    end

    return {
      -- Défilement demi-page avec centrage (Ctrl+u/d)
      { "<C-u>", scroll_and_center(neoscroll.ctrl_u, 250), mode = { "n", "v", "x" }, desc = "Scroll up half page" },
      { "<C-d>", scroll_and_center(neoscroll.ctrl_d, 250), mode = { "n", "v", "x" }, desc = "Scroll down half page" },

      -- Alias avec flèches (Ctrl+Up/Down)
      {
        "<C-Up>",
        scroll_and_center(neoscroll.ctrl_u, 650),
        mode = { "n", "v", "x" },
        desc = "Scroll up half page (arrow)",
      },
      {
        "<C-Down>",
        scroll_and_center(neoscroll.ctrl_d, 650),
        mode = { "n", "v", "x" },
        desc = "Scroll down half page (arrow)",
      },

      -- Commandes de positionnement
      {
        "zt",
        function()
          neoscroll.zt({ half_win_duration = 250 })
        end,
        mode = { "n", "v", "x" },
        desc = "Position cursor at top",
      },
      {
        "zz",
        function()
          neoscroll.zz({ half_win_duration = 250 })
        end,
        mode = { "n", "v", "x" },
        desc = "Center cursor",
      },
      {
        "zb",
        function()
          neoscroll.zb({ half_win_duration = 250 })
        end,
        mode = { "n", "v", "x" },
        desc = "Position cursor at bottom",
      },
    }
  end,
}
