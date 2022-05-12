local ok, modes = pcall(require, "modes")
if not ok then
    return
end

local M = {}

local default_settings = {}

M.setup = function()
    modes.setup(default_settings)
end

return M
