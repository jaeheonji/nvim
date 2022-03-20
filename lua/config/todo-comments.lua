local present, todo_comments = pcall(require, "todo-comments")
if not present then
    return
end

local M = {}

local default = {}

function M.setup()
    todo_comments.setup(default)
end

return M
