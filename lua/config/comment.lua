local ok, comment = pcall(require, "Comment")
if not ok then
    return
end

local settings = require("core.utils").override("comment", {})

comment.setup(settings)
