-- plugins/leetcode.lua
return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- utile si treesitter-html est installé
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lang = "typescript",
    injector = {
      ["typescript"] = {
        before = { "import { readInput } from './utils';" }, -- si utile
      },
    },
    picker = { provider = "telescope" }, -- ou nil, fzf-lua, snacks-picker
    console = {
      open_on_runcode = true,
      dir = "row",
      size = { width = "90%", height = "75%" },
    },
    description = { position = "left", width = "40%", show_stats = true },
    image_support = false,
  },
}
