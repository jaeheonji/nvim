local present, trouble = pcall(require, "trouble")
if not present then
    return
end

local M = {}

local default_settings = {}

M.setup = function()
    trouble.setup(default_settings)
end

return M
