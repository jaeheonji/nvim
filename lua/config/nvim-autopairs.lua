local present, npairs = pcall(require, "nvim-autopairs")
if not present then
    return
end

local M = {}

function M.setup()
    npairs.setup({ check_ts = true })
end

return M
