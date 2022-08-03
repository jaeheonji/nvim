local ok, mason = pcall(require, "mason")
if not ok then
    return
end

local settings = require("core.utils").override("mason", {})

mason.setup(settings)
