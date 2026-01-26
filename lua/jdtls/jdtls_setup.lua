local M = {}

function M:setup()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
  local os_name = vim.loop.os_uname().sysname

  -- Determine Java executable path based on OS
  local java_executable
  if os_name == "Windows_NT" then
    -- Windows: Use Java 21 explicitly
    java_executable = "C:/Program Files/Java/jdk-21/bin/java.exe"
  else
    -- Linux/Mac: Try to use Java 21 from common locations or PATH
    local possible_paths = {
      "/usr/lib/jvm/java-21-openjdk/bin/java",
      "/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
      "/usr/lib/jvm/jdk-21/bin/java",
      os.getenv("JAVA_HOME") and (os.getenv("JAVA_HOME") .. "/bin/java") or nil,
      "java", -- fallback to PATH
    }
    for _, path in ipairs(possible_paths) do
      if path and vim.fn.executable(path) == 1 then
        java_executable = path
        break
      end
    end
    java_executable = java_executable or "java"
  end

  local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

      -- 💀
      java_executable, -- Auto-detected Java 21+ path
      -- JDTLS requires Java 21 or newer

      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",

      -- 💀
      "-jar",
      vim.fn.glob(vim.fn.stdpath("data")
        .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true),
      -- Must point to the                                                     Change this to
      -- eclipse.jdt.ls installation                                           the actual version

      -- 💀
      "-configuration",
      vim.fn.stdpath("data")
        .. "/mason/packages/jdtls/config_"
        .. (os_name == "Windows_NT" and "win" or os_name == "Linux" and "linux" or "mac"),
      -- eclipse.jdt.ls installation            Depending on your system.

      -- 💀
      -- See `data directory configuration` section in the README
      "-data",
      workspace_dir,
    },

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {},
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = vim.split(
        vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        "\n",
        { trimempty = true }
      ),
    },
  }
  -- This starts a new client & server,
  -- or attaches to an existing client & server depending on the `root_dir`.
  require("jdtls").start_or_attach(config)

  -- Setup DAP for Java
  require("jdtls.dap").setup_dap_main_class_configs()
end

return M
