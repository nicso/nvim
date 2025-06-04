local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)
vim.keymap.set({ "n", "i" }, "<C-e>", function()
  if vim.fn.mode() == "i" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  end
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
