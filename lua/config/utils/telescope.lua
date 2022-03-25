local present, telescope = pcall(require, "telescope")
if not present then
    return
end

local M = {}

local actions = require("telescope.actions")

local default = {
    defaults = {
        winblend = 20,

        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

        prompt_prefix = " > ",
        selection_caret = " > ",
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-s>"] = actions.select_horizontal,
            },
        },
    },
}

function M.setup()
    telescope.setup(default)
end

return M
