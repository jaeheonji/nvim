local present, dressing = pcall(require, "dressing")
if not present then
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
