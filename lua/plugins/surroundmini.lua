return {
  "echasnovski/mini.surround",
  version = false,
  config = function()
    require("mini.surround").setup({
      custom_surroundings = nil,
      highlight_duration = 500,
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
      n_lines = 20,
      respect_selection_type = false,
      search_method = "cover",
      silent = false,
    })
  end,
}
