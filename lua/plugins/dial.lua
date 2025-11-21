return {
  "monaqa/dial.nvim",
  keys = {
    {
      "<a-a>",
      function()
        return require("dial.map").inc_normal()
      end,
      expr = true,
      desc = "Increment",
    },
    {
      "<a-s>",
      function()
        return require("dial.map").dec_normal()
      end,
      expr = true,
      desc = "Decrement",
    },
    {
      "<a-a>",
      function()
        return require("dial.map").inc_visual()
      end,
      mode = "v",
      expr = true,
    },
    {
      "<a-s>",
      function()
        return require("dial.map").dec_visual()
      end,
      mode = "v",
      expr = true,
    },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.alias.bool, -- true/false
        augend.constant.new({ elements = { "yes", "no" } }),
        augend.constant.new({ elements = { "on", "off" } }),
        augend.constant.new({ elements = { "&&", "||" }, word = false }),
        augend.hexcolor.new({ case = "lower" }),
      },
    })
  end,
}
