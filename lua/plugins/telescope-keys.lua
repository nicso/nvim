return {
  "nvim-telescope/telescope.nvim", -- 👈 assure que Telescope est bien installé
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.getcwd(), -- 🔥 dossier courant (mis à jour par tes bookmarks)
          prompt_title = "Find File (Current Directory)",
        })
      end,
      desc = "Find File (Current Directory fuck)",
    },
  },
}
