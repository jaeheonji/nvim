local present, todo_comments = pcall(require, "todo-comments")
if not present then
    return
end

local M = {}

local default_settings = {}

M.setup = function()
    todo_comments.setup(default_settings)
end

return M
