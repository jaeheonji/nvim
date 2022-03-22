local dracula = require("core.colors").palette

local git = require("feline.providers.git")
local vi_mode = require("feline.providers.vi_mode")

local gps = require("nvim-gps")

local function carriage_return()
    local os = vim.bo.fileformat:upper()
    if os == "UNIX" then
        return "LF"
    elseif os == "MAC" then
        return "CR"
    else
        return "CRLF"
    end
end

return {
    active = {
        -- [1]
        {
            { -- Vim Mode
                provider = function()
                    return " " .. vi_mode.get_vim_mode() .. " "
                end,
                hl = function()
                    return {
                        name = vi_mode.get_mode_highlight_name(),
                        fg = dracula.bgdarker,
                        bg = vi_mode.get_mode_color(),
                        style = "bold",
                    }
                end,
                right_sep = " ",
            },
            { -- Git Branch
                provider = function()
                    local branch_name = git.git_branch()
                    return (branch_name == "") and "No Branch" or branch_name
                end,
                icon = "🌱 ",
                left_sep = " ",
                right_sep = " ",
            },
            { -- Fileinfo
                provider = {
                    name = "file_info",
                    opts = {
                        type = "relative_short",
                        -- file_modified_icon = "✏️",
                    },
                },
                left_sep = " ",
                right_sep = " ",
            },
            { -- Position
                provider = "position",
                left_sep = " ",
                right_sep = " ",
            },
            { -- Line Percentage
                provider = "line_percentage",
                left_sep = " ",
                right_sep = " ",
            },
            {
                provider = function()
                    return gps.get_location()
                end,
                enabled = function()
                    return gps.is_available()
                end,
            },
        },
        -- [2]
        {
            { -- Diagnostic Errors
                provider = "diagnostic_errors",
                hl = { fg = dracula.red },
                right_sep = " ",
            },
            { -- Diagnostic Warnings
                provider = "diagnostic_warnings",
                hl = { fg = dracula.yellow },
                right_sep = " ",
            },
            { -- Diagnostic Hints
                provider = "diagnostic_hints",
                hl = { fg = dracula.cyan },
                right_sep = " ",
            },
            { -- Diagnostic Info
                provider = "diagnostic_info",
                hl = { fg = dracula.cyan },
                right_sep = " ",
            },
            { -- LSP Client
                provider = "lsp_client_names",
                icon = "⚙️  ",
                left_sep = " ",
                right_sep = "  ",
            },
            { -- Carriage Return
                provider = carriage_return,
                left_sep = " ",
                right_sep = " ",
            },
            { -- Encoding
                provider = "file_encoding",
                left_sep = " ",
                right_sep = " ",
            },
            { -- File Type
                provider = "file_type",
                left_sep = " ",
                right_sep = " ",
            },
        },
    },
    inactive = {
        -- [1]
        {
            { -- Vim Mode
                provider = function()
                    return " DRACULA-NVIM "
                end,
                hl = function()
                    return {
                        name = vi_mode.get_mode_highlight_name(),
                        fg = dracula.bgdarker,
                        bg = vi_mode.get_mode_color(),
                        style = "bold",
                    }
                end,
                right_sep = " ",
            },
            { -- Fileinfo
                provider = {
                    name = "file_info",
                    opts = {
                        type = "relative_short",
                        -- file_modified_icon = "✏️",
                    },
                },
                left_sep = " ",
                right_sep = " ",
            },
        },
        -- [2]
        {

            { -- Carriage Return
                provider = carriage_return,
                left_sep = " ",
                right_sep = " ",
            },
            { -- Encoding
                provider = "file_encoding",
                left_sep = " ",
                right_sep = " ",
            },
            { -- File Type
                provider = "file_type",
                left_sep = " ",
                right_sep = " ",
            },
        },
    },
}
