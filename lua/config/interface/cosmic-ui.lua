local ok, cosmic_ui = pcall(require, "cosmic-ui")
if not ok then
    return
end

local M = {}

local default_settings = {
    border_style = "single",
}

M.setup = function()
    cosmic_ui.setup(default_settings)
end

return M
