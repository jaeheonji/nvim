local present, stabilize = pcall(require, "stabilize")
if not present then
    return
end

local M = {}

M.setup = function()
    stabilize.setup()
end

return M
