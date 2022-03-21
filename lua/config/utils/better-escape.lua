local present, better_escape = pcall(require, "better_escape")
if not present then
    return
end

local M = {}

local default = {
    mapping = { "ii" },
    timeout = 200,
    clear_empty_lines = true,
}

function M.setup()
    better_escape.setup(default)
end

return M
