local ok, dressing = pcall(require, "dressing")
if not ok then
    return
end

local M = {}

local default_settings = {
    select = {
        backend = { "telescope", "nui", "builtin" },

        telescope = require("telescope.themes").get_dropdown({
            borderchars = {
                { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            },
        }),
    },
}

M.setup = function()
    dressing.setup(default_settings)
end

return M
