return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "Day",
          colorscheme = "kanagawa-lotus",
        },
        {
          name = "Night",
          colorscheme = "kanagawa-dragon",
        },
      },
      livePreview = true, -- Apply theme while picking. Default to true.
      -- add the config here
    })
  end,
}
