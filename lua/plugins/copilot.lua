return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      filetypes = {
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = "<C-b>",
          accept_line = "<C-e>",
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-c>",
        },
      },
    })
  end,
}
