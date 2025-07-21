return {
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "lommix/godot.nvim",
  },
  {
    "habamax/vim-godot",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "gdscript",
          "godot_resource",
          "gdshader",
          "regex", -- ✅ Ajout du parser regex manquant
          "javascript", -- Pour noice.nvim
          "json",
          "markdown",
          "html",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
