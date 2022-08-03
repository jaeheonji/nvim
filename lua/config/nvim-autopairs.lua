local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
    return
end

local settings = require("core.utils").override("nvim-autopairs", {
    check_ts = true
})

npairs.setup(settings)
