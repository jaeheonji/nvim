local ok, feline = pcall(require, "feline")
if not ok then
    return
end

local ctp_feline = require('catppuccin.groups.integrations.feline')
-- ctp_feline.setup()

local settings = require("core.utils").override("feline", {
    components = ctp_feline.get(),
})

feline.setup(settings)
