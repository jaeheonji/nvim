local M = {}

function M.impatient()
    local present, impatient = pcall(require, "impatient")
    if present then
        impatient.enable_profile()
    end
end

return M
