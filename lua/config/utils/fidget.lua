local ok, fidget = pcall(require, "fidget")
if not ok then
    return
end

local M = {}

local default_settings = {
    window = { blend = 20 },
}

M.setup = function()
    fidget.setup(default_settings)
end

return M
