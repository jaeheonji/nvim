local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local M = {}

local default_settings = {
    options = {
        numbers = function(opts)
            return string.format(" %s:", opts.ordinal)
        end,

        indicator_icon = "▊",
        modified_icon = "",

        tab_size = 20,
        separator_style = { "", "" },

        offsets = {
            {
                filetype = "neo-tree",
                text = " File Explore",
                highlight = "CustomDirectory",
                padding = 1,
            },
        },
    },
    highlights = require("themes").get("bufferline"),
}

M.setup = function()
    bufferline.setup(default_settings)

    require("core.key-bindings").bufferline()
end

return M
