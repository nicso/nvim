return {
  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    config = function()
      local ccc = require("ccc")
      ccc.setup({
        -- Enable highlighter
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        -- Preserve previous colors
        preserve = true,
        --test = #958c51,
        -- Alpha slider
        alpha_show = "auto", -- "auto" | "always" | "hide"
        -- Custom mappings for the picker
        mappings = {
          -- Navigation
          ["<Right>"] = ccc.mapping.increase1,
          ["<S-Right>"] = ccc.mapping.increase5,
          ["<C-Right>"] = ccc.mapping.increase10,
          ["<Left>"] = ccc.mapping.decrease1,
          ["<S-Left>"] = ccc.mapping.decrease5,
          ["<C-Left>"] = ccc.mapping.decrease10,
          -- Set value
          ["d"] = ccc.mapping.set0,
          ["t"] = ccc.mapping.set50,
          ["D"] = ccc.mapping.set100,
          -- Modes
          ["o"] = ccc.mapping.cycle_out_mode,
          ["m"] = ccc.mapping.cycle_in_mode,
          ["a"] = ccc.mapping.toggle_alpha,
          -- Confirm/Quit
          ["<CR>"] = ccc.mapping.complete,
          ["q"] = ccc.mapping.quit,
          ["<Esc>"] = ccc.mapping.quit,
          -- Previous colors
          ["g"] = ccc.mapping.toggle_prev_colors,
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color picker" })
      vim.keymap.set("n", "<leader>cc", "<cmd>CccConvert<CR>", { desc = "Convert color format" })
      vim.keymap.set("n", "<leader>ct", "<cmd>CccHighlighterToggle<CR>", { desc = "Toggle color highlighter" })
    end,
  },
}
