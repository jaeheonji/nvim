local present, gps = pcall(require, "nvim-gps")
if not present then
    return
end

local M = {}

function M.setup()
    gps.setup()
end

return M
