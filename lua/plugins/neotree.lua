return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true, -- <-- Affiche les fichiers cachés
        show_hidden_count = true,
        hide_dotfiles = false, -- <-- Ne pas cacher les fichiers commençant par un "."
        hide_gitignored = true, -- <-- Ne pas cacher les fichiers ignorés par git (facultatif)
      },
    },
    window = {
      mappings = {
        ["<Right>"] = "open",
        ["<Left>"] = "close_node",
        ["<S-Right>"] = "next_source",
        ["<S-Left>"] = "prev_source",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          unstaged = "󰄱",
        },
      },
    },
  },
}
