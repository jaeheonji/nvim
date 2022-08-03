local ok, pfold = pcall(require, "pretty-fold")
if not ok then
    return
end

local settings = require("core.utils").override("pretty-fold", {})

pfold.setup(settings)
