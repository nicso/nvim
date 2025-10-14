return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    -- Basic configuration
    vim.g.VM_default_mappings = 1
    vim.g.VM_mouse_mappings = 1

    -- Only override specific mappings to avoid conflicts
    vim.g.VM_maps = {
      ["Add Cursor At Pos"] = "<leader>mp",
    }
  end,
}