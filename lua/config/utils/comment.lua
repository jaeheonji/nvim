local ok, comment = pcall(require, "Comment")
if not ok then
    return
end

local M = {}

M.setup = function()
    comment.setup()
end

return M
