local present, comment = pcall(require, "Comment")
if not present then
    return
end

local M = {}

M.setup = function()
    comment.setup()
end

return M
