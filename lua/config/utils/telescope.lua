local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local M = {}

local actions = require("telescope.actions")

local default_settings = {
    defaults = {
        winblend = 40,

        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

        prompt_prefix = "> ",
        selection_caret = "> ",
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-s>"] = actions.select_horizontal,
            },
        },
        pickers = {
            find_files = {
                find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
            },
        },
    },
}

M.setup = function()
    telescope.setup(default_settings)
end

return M
