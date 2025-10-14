vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then
      return
    end

    -- Disable semantic highlights
    client.server_capabilities.semanticTokensProvider = nil

    local opts = { buffer = event.buf }

    -- Check if LSPSaga is available, use it instead of default LSP functions
    local lspsaga_ok, _ = pcall(require, "lspsaga")

    if lspsaga_ok then
      -- LSPSaga enhanced keymaps
      vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
      vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
      vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
      vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", opts)
      vim.keymap.set("n", "<F4>", "<cmd>Lspsaga code_action<CR>", opts)
      vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    else
      -- Fallback to default LSP keymaps
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>", opts)
      vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>", opts)
    end

    -- Keep these LSP defaults
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set({ "n", "x" }, "=", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  end,
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        disable = {
          "undefined-global",
          "undefined-field",
        },
      },
    },
  },
})

lspconfig.csharp_ls.setup({
  handlers = {
    ["textDocument/definition"] = require("csharpls_extended").handler,
    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
  },
  on_attach = function(client)
    require("csharpls_extended").buf_read_cmd_bind()
  end,
})

lspconfig.dartls.setup({
  on_attach = function(client)
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end,
  settings = {
    dart = {
      lineLength = 160,
      showTodos = true,
    },
  },
})

lspconfig.ts_ls.setup({
  on_attach = function(client)
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end,
})

lspconfig.gdscript.setup({})

-- Tailwind CSS LSP for autocompletion
lspconfig.tailwindcss.setup({
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
    "astro",
    "php",
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    require("jdtls.jdtls_setup").setup()
  end,
})
