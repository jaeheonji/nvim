local ok, alpha = pcall(require, "alpha")
if not ok then
    return
end

local M = {}

M.setup = function()
    local config = require("alpha.themes.theta").config
    alpha.setup(config)
end

return M
