local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- increment/decrement
-- keymap.set("n", "<C-w>", "<C-a>", opts)
-- keymap.set("n", "<C-f>", "<C-x>", opts)
-- better undo
keymap.set("n", "U", "<C-r>")
-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- normal mode on hh
keymap.set("i", "hh", "<Esc>")
-- delete backward
keymap.set("n", "db", "vb_d")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- splits
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- close window
keymap.set("n", "<C-q>", "<C-w>q")
-- navigate windows
keymap.set("n", "sr", "<C-w>h")
keymap.set("n", "si", "<C-w>l")
keymap.set("n", "st", "<C-w>j")
keymap.set("n", "sd", "<C-w>k")

keymap.set("i", "<C-r>", "<Esc>vbdi")

keymap.set("i", "<C-z>", "<Esc>ui")
keymap.set("n", "dw", "bdw")

-- copilot
keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", opts)
keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", opts)

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "FileType" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})
