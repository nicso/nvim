return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- Charge en priorité avant les autres plugins
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false, -- false = background opaque, true = transparent
          dim_inactive = true, -- Atténue les fenêtres inactives
          terminal_colors = false, -- Configure les couleurs du terminal intégré
          styles = {
            comments = "italic", -- Style pour les commentaires
            keywords = "bold", -- Style pour les mots-clés
            types = "NONE", -- Style pour les types
          },
        },
        groups = {
          all = {
            NormalNC = { bg = "#191919" },
          },
        },
      })

      vim.cmd("colorscheme nightfox") -- ou "nightfox", "dayfox", "dawnfox", "duskfox", "terafox", "carbonfox"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox", -- Doit correspondre au thème chargé ci-dessus
    },
  },
}
