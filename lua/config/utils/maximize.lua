local ok, maximize = pcall(require, "maximize")
if not ok then
    return
end

local M = {}

local default_settings = {
    default_keymaps = false,
}

M.setup = function()
    maximize.setup(default_settings)
end

return M
