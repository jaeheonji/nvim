local present, comment = pcall(require, "Comment")
if not present then
    return
end

local M = {}

function M.setup()
    comment.setup()
end

return M
