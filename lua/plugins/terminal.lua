return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local maven = Terminal:new({
      cmd = "mvn",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _MAVEN_TOGGLE()
      maven:toggle()
    end

    local node = Terminal:new({
      cmd = "node",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _NODE_TOGGLE()
      node:toggle()
    end

    local gitui = Terminal:new({
      cmd = "gitui",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _GITUI_TOGGLE()
      gitui:toggle()
    end

    local btm = Terminal:new({
      cmd = "btm",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _BTM_TOGGLE()
      btm:toggle()
    end

    -- Keymaps using uppercase T to avoid conflicts with testing plugin
    vim.keymap.set("n", "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
    vim.keymap.set("n", "<leader>Th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal terminal" })
    vim.keymap.set("n", "<leader>Tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })
    vim.keymap.set("n", "<leader>Tm", "<cmd>lua _MAVEN_TOGGLE()<CR>", { desc = "Maven terminal" })
    vim.keymap.set("n", "<leader>Tn", "<cmd>lua _NODE_TOGGLE()<CR>", { desc = "Node terminal" })
    vim.keymap.set("n", "<leader>Tg", "<cmd>lua _GITUI_TOGGLE()<CR>", { desc = "GitUI terminal" })
    vim.keymap.set("n", "<leader>Tb", "<cmd>lua _BTM_TOGGLE()<CR>", { desc = "Bottom terminal" })
  end,
  },
}