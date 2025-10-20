return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
      file_ignore_patterns = {
        "node_modules",
        "node_modules/",
        ".git/",
        "dist/",
        "build/",
        "%.lock",
      },
      mappings = {
        n = {
          ["q"] = require("telescope.actions").close,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
        "--glob=!node_modules/",
      },
    },
    extensions_list = { "themes", "terms" },
    extensions = {},
  },
}
