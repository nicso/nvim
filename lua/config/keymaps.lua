local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { silent = true })

vim.keymap.set("n", "<C-r>", "<C-W>h", { desc = "switch to left window" })
vim.keymap.set("n", "<C-i>", "<C-W>l", { desc = "switch to right window" })
vim.keymap.set("n", "<C-d>", "<C-W>k", { desc = "switch to top window" })
vim.keymap.set("n", "<C-t>", "<C-W>j", { desc = "switch to bottom window" })

-- save all and quit
vim.keymap.set("n", "Q", "<cmd>wqa<CR>", { desc = "save all and quit" })
