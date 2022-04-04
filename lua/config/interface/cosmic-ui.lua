local present, cosmic_ui = pcall(require, "cosmic-ui")
if not present then
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
