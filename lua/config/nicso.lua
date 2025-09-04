vim.g.ai_cmp = false
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- increment/decrement
-- keymap.set("n", "<C-w>", "<C-a>", opts)
-- keymap.set("n", "<C-f>", "<C-x>", opts)
vim.o.keymodel = "startsel,stopsel"

-- better undo
keymap.set("n", "U", "<C-r>")
-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- normal mode on hh
keymap.set("i", "hh", "<Esc>")
-- delete backward
keymap.set("n", "db", "vb_d")
-- splits
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- close window
keymap.set("n", "<C-q>", "<C-w>q")
-- navigate windows
keymap.set("n", "sr", "<C-w>h", opts)
keymap.set("n", "si", "<C-w>l", opts)
keymap.set("n", "st", "<C-w>j", opts)
keymap.set("n", "sd", "<C-w>k", opts)

keymap.set("i", "<C-r>", "<Esc>vbdi", opts)

keymap.set("i", "<C-z>", "<Esc>ui", opts)
keymap.set("n", "dw", "bdw", opts)

keymap.set("n", "<C-M-r>", "<S-h>", { remap = true })
keymap.set("n", "<C-M-i>", "<S-l>", { remap = true })

keymap.set({ "n", "i" }, "<A-d>", "<A-k>", { remap = true })
keymap.set({ "n", "i" }, "<A-t>", "<A-j>", { remap = true })

-- copilot
keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", opts)
keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", opts)

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "FileType" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.wrap = true
    vim.opt.textwidth = 80 -- Limite le texte à 80 colonnes
    vim.opt.linebreak = true -- Coupe sur les mots, pas au milieu
    vim.opt.formatoptions:append("t") -- Permet le formatage automatique
    vim.opt.formatoptions:append("n")
  end,
})

vim.keymap.set("n", "<leader>gr", ":GodotRun<CR>", { desc = "Run Godot project" })
