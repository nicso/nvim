-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.nicso")
-- require("config.harpoon")
-- require("config.godot")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local path = vim.fn.stdpath("data") .. "/shada"
    local handle = vim.loop.fs_scandir(path)
    if handle then
      while true do
        local name = vim.loop.fs_scandir_next(handle)
        if not name then
          break
        end
        if name:match("^main%.shada%.tmp%..+") then
          vim.loop.fs_unlink(path .. "/" .. name)
        end
      end
    end
  end,
})

-- vim.g.godot_executable = "D:/Godot/Godot.exe"
