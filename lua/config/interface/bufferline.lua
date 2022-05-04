local ok, bufferline = pcall(require, "bufferline")
if not ok then
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
                text = " File Explorer",
                highlight = "CustomExplorerTitle",
                padding = 1,
            },
        },
    },
}

M.setup = function()
    bufferline.setup(default_settings)

    require("core.key-bindings").bufferline()
end

return M
