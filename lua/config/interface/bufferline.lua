local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local M = {}

local default = {
    options = {
        offsets = {
            { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
        },
    },
}

function M.setup()
    bufferline.setup(default)
end

return M
