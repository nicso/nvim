return {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>", { desc = "Buffer Delete" })
  end,
}
