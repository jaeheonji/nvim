local ok, bufferline = pcall(require, "bufferline")
if not ok then
    return
end

local settings = require("core.utils").override("bufferline", {
    options = {
        offsets = {
            {
                filetype = "neo-tree",
                padding = 1
            },
        },
    },
})

bufferline.setup(settings)
