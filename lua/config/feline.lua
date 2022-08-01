local ok, feline = pcall(require, "feline")
if not ok then
    return
end

local cp = require("catppuccin.palettes").get_palette()

local vi_mode = {
    ["n"] = { "NORMAL", cp.blue },
    ["no"] = { "N-PENDING", cp.blue },
    ["i"] = { "INSERT", cp.green },
    ["ic"] = { "INSERT", cp.green },
    ["t"] = { "TERMINAL", cp.green },
    ["v"] = { "VISUAL", cp.flamingo },
    ["V"] = { "V-LINE", cp.flamingo },
    -- [""] = { "V-BLOCK", cp.flamingo },
    ["R"] = { "REPLACE", cp.maroon },
    ["Rv"] = { "V-REPLACE", cp.maroon },
    ["s"] = { "SELECT", cp.maroon },
    ["S"] = { "S-LINE", cp.maroon },
    -- [""] = { "S-BLOCK", cp.maroon },
    ["c"] = { "COMMAND", cp.peach },
    ["cv"] = { "COMMAND", cp.peach },
    ["ce"] = { "COMMAND", cp.peach },
    ["r"] = { "PROMPT", cp.teal },
    ["rm"] = { "MORE", cp.teal },
    ["r?"] = { "CONFIRM", cp.mauve },
    ["!"] = { "SHELL", cp.green },
}

local empty_sep = { str = " ", hl = { bg = cp.mantle } }

local settings = require("core.utils").override("feline", {
    components = {
        active = {
            { -- Left components
                {
                    provider = function()
                        return " \u{e7c5} " .. vi_mode[vim.fn.mode()][1] .. " "
                    end,
                    hl = function()
                        return {
                            fg = cp.crust,
                            bg = vi_mode[vim.fn.mode()][2],
                            style = "bold",
                        }
                    end,
                    right_sep = empty_sep,
                },
                {
                    provider = "file_info",
                    hl = { fg = cp.text, bg = cp.mantle },
                    left_sep = empty_sep,
                    right_sep = empty_sep,
                },
                {
                    provider = "git_branch",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                    left_sep = empty_sep,
                    right_sep = empty_sep,
                },
                {
                    provider = "git_diff_added",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                },
                {
                    provider = "git_diff_changed",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                },
                {
                    provider = "git_diff_removed",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                },
            },
            { -- Middle components
            },
            { -- Right components
                {
                    provider = "diagnostic_errors",
                    hl = { fg = cp.red, bg = cp.mantle },
                    right_sep = empty_sep,
                },
                {
                    provider = "diagnostic_warnings",
                    hl = { fg = cp.yellow, bg = cp.mantle },
                    right_sep = empty_sep,
                },
                {
                    provider = "diagnostic_info",
                    hl = { fg = cp.bule, bg = cp.mantle },
                    right_sep = empty_sep,
                },
                {
                    provider = "diagnostic_hints",
                    hl = { fg = cp.teal, bg = cp.mantle },
                    right_sep = empty_sep,
                },
                {
                    provider = "lsp_client_names",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                    left_sep = empty_sep,
                    right_sep = empty_sep,
                },
                {
                    provider = "position",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                    left_sep = empty_sep,
                    right_sep = empty_sep,
                },
                {
                    provider = "file_encoding",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                    left_sep = empty_sep,
                    right_sep = empty_sep,
                },
                {
                    provider = "file_type",
                    hl = { fg = cp.overlay1, bg = cp.mantle },
                    left_sep = empty_sep,
                    right_sep = empty_sep,
                },
            },
        },
        -- inactive = {},
    },
})

feline.setup(settings)
