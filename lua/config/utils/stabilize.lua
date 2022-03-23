local present, stabilize = pcall(require, "stabilize")
if not present then
    return
end

local M = {}

function M.setup()
    stabilize.setup()
end

return M
