local present, better_escape = pcall(require, "better_escape")
if not present then
    return
end

local M = {}

local default_settings = {
    mapping = { "ii" },
    timeout = 200,
    clear_empty_lines = true,
}

M.setup = function()
    better_escape.setup(default_settings)
end

return M
