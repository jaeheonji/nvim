local present, npairs = pcall(require, "nvim-autopairs")
if not present then
    return
end

local M = {}

M.setup = function()
    npairs.setup({ check_ts = true })
end

return M
