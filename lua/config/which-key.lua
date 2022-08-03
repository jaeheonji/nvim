local ok, wkey = pcall(require, "which-key")
if not ok then
    return
end

local settings = require("core.utils").override("which-key", {
    layout = { align = "center", spacing = 10 },
    window = {
        border = "single",
    },
})

wkey.setup(settings)
