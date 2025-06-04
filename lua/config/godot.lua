local lspconfig = require("lspconfig")

local paths_to_check = { "", "../" }
local is_godot_project = false
local godot_project_path = ""
local cwd = vim.fn.getcwd()

for _, value in ipairs(paths_to_check) do
  local path = vim.fn.expand(cwd .. "/" .. value .. "project.godot")
  if vim.loop.fs_stat(path) then
    is_godot_project = true
    godot_project_path = vim.fn.expand(cwd .. "/" .. value)
    break
  end
end

if is_godot_project then
  lspconfig.gdscript.setup({})
end

print("Godot project detected:", is_godot_project, "at", godot_project_path)
