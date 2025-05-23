return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local function open_neotree_at(path)
      local resolved_path = vim.fn.expand(path) -- pour gérer ~
      vim.cmd.cd(resolved_path) -- 🔧 change le cwd global
      require("neo-tree.command").execute({
        action = "show",
        source = "filesystem",
        position = "left",
        reveal = true,
        dir = path,
      })
    end

    vim.keymap.set("n", "<leader>fp", function()
      open_neotree_at("C:/Users/Nicso/werk/")
    end, { desc = "Favori: Projets" })

    vim.keymap.set("n", "<leader>fc", function()
      open_neotree_at("C:/Users/Nicso/AppData/Local/nvim")
    end, { desc = "Favori: Configs" })

    return opts
  end,
}
