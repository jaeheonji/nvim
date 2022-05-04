local ok, stabilize = pcall(require, "stabilize")
if not ok then
    return
end

local M = {}

M.setup = function()
    stabilize.setup()
end

return M
