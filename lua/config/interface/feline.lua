local present, lualine = pcall(require, "feline")
if not present then
    return
end

local M = {}

local default = {}

function M.setup()
    lualine.setup(default)
end

return M
