local ok, trouble = pcall(require, "trouble")
if not ok then
    return
end

local M = {}

local default_settings = {}

M.setup = function()
    trouble.setup(default_settings)
end

return M
