return {
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = function(_, opts)
      -- Disable Enter key for completion, make it fallback to normal newline
      opts.keymap = opts.keymap or {}
      opts.keymap["<CR>"] = { "cancel", "fallback" }

      -- Ensure Tab confirms selection
      opts.keymap["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" }
      opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }

      return opts
    end,
  },
}