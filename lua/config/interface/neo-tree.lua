local present, neo_tree = pcall(require, "neo-tree")
if not present then
    return
end

local M = {}

function M.setup()
    neo_tree.setup()
end

return M
