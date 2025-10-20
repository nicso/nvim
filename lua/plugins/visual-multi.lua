return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    -- Basic configuration
    vim.g.VM_default_mappings = 1
    vim.g.VM_mouse_mappings = 1

    -- Override mappings to avoid conflicts with neoscroll (Ctrl+Up/Down)
    vim.g.VM_maps = {
      ["Add Cursor At Pos"] = "<leader>mp",
      -- Remap Ctrl+Up/Down to leader+m + j/k (down/up)
      ["Add Cursor Down"] = "<leader>mj", -- was <C-Down>
      ["Add Cursor Up"] = "<leader>mk", -- was <C-Up>
    }
  end,
}