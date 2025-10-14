-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.o.keymodel = "startsel"
-- Home keys --
vim.keymap.set({ "n", "v" }, "<Home>", "^", opts)
vim.keymap.set("i", "<Home>", "<C-o>^", opts)

-- Buffer navigation
vim.keymap.set("n", "<C-PageUp>", "<cmd>bprevious<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<C-PageDown>", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>Bdelete<CR>", { desc = "Delete current buffer", silent = true })
-- Alternative buffer navigation (more reliable)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer", silent = true })

---- Moving lines ----
-- VISUAL
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- NORMAL
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { desc = "Move current line down" })

-- INSERT
vim.keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move current line up (insert)" })
vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move current line down (insert)" })

---- quick move ----
vim.keymap.set("n", "<C-Down>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-Up>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- paste without replacing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- delete without copy
vim.keymap.set("n", "dd", [["_dd]], opts)
vim.keymap.set("v", "d", [["_d]], opts)
vim.keymap.set("n", "x", '"_x', opts)

-- ecape insert mode
vim.keymap.set("i", "hh", "<Esc>")
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- format document
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fr", function()
  builtin.oldfiles({ cwd = vim.fn.getcwd(), cwd_only = true })
end, { desc = "Telescope recent project files" })

vim.keymap.set(
  "n",
  "<leader>rn",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globaly" }
)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

---- tabs ---

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- Resize splits directionally (consistent with arrow direction)
vim.keymap.set("n", "<C-M-Left>", "<C-w>3<", { desc = "Resize split left" }) -- pousse bordure gauche
vim.keymap.set("n", "<C-M-Right>", "<C-w>3>", { desc = "Resize split right" }) -- pousse bordure droite
vim.keymap.set("n", "<C-M-Up>", "<C-w>1+", { desc = "Resize split up" }) -- pousse bordure haute
vim.keymap.set("n", "<C-M-Down>", "<C-w>1-", { desc = "Resize split down" }) -- pousse bordure basse

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { silent = true })

vim.keymap.set("n", "<C-r>", "<C-W>h", { desc = "switch to left window" })
vim.keymap.set("n", "<C-i>", "<C-W>l", { desc = "switch to right window" })
vim.keymap.set("n", "<C-d>", "<C-W>k", { desc = "switch to top window" })
vim.keymap.set("n", "<C-t>", "<C-W>j", { desc = "switch to bottom window" })

-- save all and quit
vim.keymap.set("n", "Q", "<cmd>wqa<CR>", { desc = "save all and quit" })

-- better undo
keymap.set("n", "U", "<C-r>")
-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("i", "<C-r>", "<Esc>vbdi", opts)

keymap.set("i", "<C-z>", "<Esc>ui", opts)
keymap.set("n", "dw", "bdw", opts)
keymap.set("n", "<Tab>", "<S-h>", { remap = true })
keymap.set("n", "<S-Tab>", "<S-l>", { remap = true })
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
