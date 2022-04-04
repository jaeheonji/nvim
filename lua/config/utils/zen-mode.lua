local present, zen_mode = pcall(require, "zen-mode")
if not present then
    return
end

local M = {}

local default_settings = {
    window = { width = 0.8, height = 0.8 },
}

M.setup = function()
    zen_mode.setup(default_settings)
end

return M
