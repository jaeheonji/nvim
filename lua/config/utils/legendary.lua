local ok, legendary = pcall(require, "legendary")
if not ok then
    return
end

local M = {}

local default_settings = {}

M.setup = function()
    legendary.setup(default_settings)

    require("core.key-bindings").legendary()
end

return M
