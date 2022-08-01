local ok, splits = pcall(require, "smart-splits")
if not ok then
    return
end

local settings = require("core.utils").override("smart-splits", {})

splits.setup(settings)
