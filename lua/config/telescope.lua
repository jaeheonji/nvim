local present, telescope = pcall(require, "telescope")
if not present then
    return
end

local M = {}

local default = {
    defaults = {
        prompt_prefix = " > ",
        selection_caret = " > ",
        mappings = {
            i = { ["<ESC>"] = require("telescope.actions").close },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor(),
        },
    },
}

function M.setup()
    telescope.setup(default)

    -- Load Extensions
    telescope.load_extension("ui-select")
end

return M
