local present, cosmic_ui = pcall(require, "cosmic-ui")
if not present then
    return
end

local M = {}

local default = {
    border_style = "rounded",
}

function M.setup()
    cosmic_ui.setup(default)
end

return M
