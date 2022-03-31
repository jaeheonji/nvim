local present, smart_splits = pcall(require, "smart-splits")
if not present then
    return
end

local M = {}

local default = {}

function M.setup()
    smart_splits.setup(default)
end

return M
