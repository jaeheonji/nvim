local ok, winshift = pcall(require, "winshift")
if not ok then
    return
end

local M = {}

local default_settings = {}

M.setup = function()
    winshift.setup(default_settings)
end

return M
