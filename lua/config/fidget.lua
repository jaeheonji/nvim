local present, fidget = pcall(require, "fidget")
if not present then
    return
end

local M = {}

local default = {}

function M.setup()
    fidget.setup(default)
end

return M
