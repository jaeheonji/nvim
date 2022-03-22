local present, feline = pcall(require, "feline")
if not present then
    return
end

local dracula = require("core.colors").palette

local M = {}

local default = {
    components = require("config.interface.feline-components"),
    theme = { fg = dracula.fg, bg = dracula.bgdarker },
    vi_mode_colors = {
        NORMAL = dracula.purple,
        OP = dracula.purple,
        INSERT = dracula.green,
        VISUAL = dracula.yellow,
        LINES = dracula.yellow,
        BLOCK = dracula.yellow,
        REPLACE = dracula.orange,
        ["V-REPLACE"] = dracula.orange,
        ENTER = dracula.cyan,
        MORE = dracula.cyan,
        SELECT = dracula.yellow,
        COMMAND = dracula.pink,
        SHELL = dracula.pink,
        TERM = dracula.green,
        NONE = dracula.comment,
    },
    disable = {
        filetypes = { "NvimTree", "Outline", "minimap" },
    },
}

function M.setup()
    feline.setup(default)
end

return M
