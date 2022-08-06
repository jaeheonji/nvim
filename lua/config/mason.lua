local ok, mason = pcall(require, "mason")
if not ok then
    return
end

local settings = require("core.utils").override("mason", {
    ui = {
        border = "single",
    },
})

mason.setup(settings)
