return {
  "y3owk1n/undo-glow.nvim",
  version = "*",
  opts = {
    animation = {
      enabled = true,
      duration = 300,
    },
  },
  keys = {
    {
      "u",
      function()
        require("undo-glow").undo()
      end,
      desc = "Undo with glow",
    },
    {
      "U",
      function()
        require("undo-glow").redo()
      end,
      desc = "Redo with glow",
    },
    {
      "p",
      function()
        require("undo-glow").paste_below()
      end,
      desc = "Paste below with glow",
    },
    {
      "P",
      function()
        require("undo-glow").paste_above()
      end,
      desc = "Paste above with glow",
    },
  },
}
