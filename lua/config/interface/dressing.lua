local present, dressing = pcall(require, "dressing")
if not present then
    return
end

local M = {}

local default = {
    select = {
        backend = { "telescope", "nui", "builtin" },
    },
}

function M.setup()
    dressing.setup(default)
end

return M
