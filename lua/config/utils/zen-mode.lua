local present, zen_mode = pcall(require, "zen-mode")
if not present then
    return
end

local M = {}

local default = {
    window = { width = 0.8, height = 0.8 },
}

function M.setup()
    zen_mode.setup(default)
end

return M
