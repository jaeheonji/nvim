local present, lualine = pcall(require, "lualine")
if not present then
    return
end

local M = {}

-- local palette = require("core.colors").palette
-- local transparentify = require("core.utils").transparentify

local spacer = {
    function()
        return " "
    end,
    padding = 0,
}

local location = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    return "Ln " .. cursor[1] .. ", Col " .. cursor[2]
end

local treesitter_status = function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
        return "綠TS"
    end
    return ""
end

local lsp_client_names = function()
    local clients = {}

    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        if client.name ~= "null-ls" then
            clients[#clients + 1] = client.name
        end
    end

    return table.concat(clients, " ")
end

-- local theme = {
--     normal = {
--         a = { fg = palette.bgdarker, bg = palette.purple, gui = "bold" },
--         b = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--         c = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--     },
--     insert = {
--         a = { fg = palette.bgdarker, bg = palette.green, gui = "bold" },
--         b = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--         c = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--     },
--     visual = {
--         a = { fg = palette.bgdarker, bg = palette.yellow, gui = "bold" },
--         b = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--         c = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--     },
--     replace = {
--         a = { fg = palette.bgdarker, bg = palette.orange, gui = "bold" },
--         b = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--         c = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--     },
--     command = {
--         a = { fg = palette.bgdarker, bg = palette.pink, gui = "bold" },
--         b = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--         c = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--     },
--     inactive = {
--         a = { fg = palette.bgdarker, bg = palette.purple, gui = "bold" },
--         b = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--         c = { fg = palette.fg, bg = transparentify(palette.bgdarker) },
--     },
-- }

local default_settings = {
    options = {
        -- theme = theme,
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {
            spacer,
            -- { "branch", icon = "", color = { fg = palette.pink } },
            { "branch", icon = "" },
            { "filetype" },
            {
                "diagnostics",
                -- diagnostics_color = {
                --     error = { fg = palette.red },
                --     warn = { fg = palette.orange },
                --     info = { fg = palette.cyan },
                --     hint = { fg = palette.yellow },
                -- },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
                update_in_insert = true,
            },
        },

        lualine_x = {
            { lsp_client_names, icon = " " },
            { location },
            { "encoding" },
            { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
            -- { treesitter_status, color = { fg = palette.green } },
            { treesitter_status },
            spacer,
        },
        lualine_y = {},
        lualine_z = { spacer },
    },
    inactive_sections = {
        lualine_a = { spacer },
        lualine_b = {},
        lualine_c = {
            spacer,
            -- { "branch", icon = "", color = { fg = palette.pink } },
            { "branch", icon = "" },
            { "filetype" },
        },

        lualine_x = {
            { location },
            { "encoding" },
            { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
            -- { treesitter_status, color = { fg = palette.green } },
            { treesitter_status },
            spacer,
        },
        lualine_y = {},
        lualine_z = { spacer },
    },
    extensions = {
        {
            filetypes = { "neo-tree" },
            sections = {
                lualine_c = {
                    {
                        function()
                            return "Neo Tree"
                        end,
                        icon = "פּ",
                        -- color = { fg = palette.pink, gui = "bold,italic" },
                    },
                },
            },
        },
        {
            filetypes = { "Outline" },
            sections = {
                lualine_c = {
                    {
                        function()
                            return "Symbols Outline"
                        end,
                        icon = "ﴰ",
                        -- color = { fg = palette.pink, gui = "bold,italic" },
                    },
                },
            },
        },
    },
}

M.setup = function()
    lualine.setup(default_settings)
end

return M
