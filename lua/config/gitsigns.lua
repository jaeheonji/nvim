local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    return
end
local settings = require("core.utils").override("gitsigns", {})

gitsigns.setup(settings)
