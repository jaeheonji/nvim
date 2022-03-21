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
}

function M.setup()
    telescope.setup(default)
end

return M
