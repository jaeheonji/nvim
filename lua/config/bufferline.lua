local ok, bufferline = pcall(require, "bufferline")
if not ok then
    return
end

local settings = require("core.utils").override("bufferline", {
    options = {
        buffer_close_icon = "\u{f00d}",
        offsets = {
            {
                filetype = "neo-tree",
                text = "🐱 File Explorer",
                highlight = "BufferLineSideBarOffset",
            },
        },
    },
})

bufferline.setup(settings)
