return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
      preset = {
        header = [[
██╗    ██╗  ██╗ █████╗ ████████╗███████╗                       
██║    ██║  ██║██╔══██╗╚══██╔══╝██╔════╝                       
██║    ███████║███████║   ██║   █████╗                         
██║    ██╔══██║██╔══██║   ██║   ╚════╝                         
██║    ██║  ██║██║  ██║   ██║   ███████╗                       
╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝                       

███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗███████╗
████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝
██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ███████╗
██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ╚════██║
██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ███████║
╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
and people
        ]],
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- Exécuter <Leader>e à la fin du chargement
    vim.api.nvim_create_autocmd("User", {
      pattern = "SnackDashboardReady",
      callback = function()
        -- On attend un peu que le dashboard se stabilise
        vim.schedule(function()
          vim.cmd([[normal! \<Leader>e]])
        end)
      end,
    })
  end,
}
