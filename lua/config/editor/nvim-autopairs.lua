local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
    return
end

local M = {}

M.setup = function()
    npairs.setup({ check_ts = true })
end

return M
