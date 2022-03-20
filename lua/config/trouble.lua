local present, trouble = pcall(require, "trouble")
if not present then
    return
end

local M = {}

local default = {}

function M.setup()
    trouble.setup(default)
end

return M
