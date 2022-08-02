local ok, alpha = pcall(require, "alpha")
if not ok then
    return
end

local function button(shortcut, description, action)
    local sc = shortcut:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = shortcut,
        cursor = 5,
        width = 30,
        align_shortcut = "right",
        hl_shortcut = "AlphaButtonShortcut",
        hl = "AlphaButtonDescription",
    }

    if action then
        opts.keymap = { "n", sc, action, { noremap = true, silent = true, nowait = true } }
    end

    return {
        type = "button",
        val = description,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc .. "<Ignore>", true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
        end,
        opts = opts,
    }
end

local header = {
    type = "text",
    val = {
        [[                                                                   ]],
        [[      ████ ██████           █████      ██                    ]],
        [[     ███████████             █████                            ]],
        [[     █████████ ███████████████████ ███   ███████████  ]],
        [[    █████████  ███    █████████████ █████ ██████████████  ]],
        [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
        [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
        [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    },
    opts = {
        position = "center",
        hl = "AlphaHeader",
    },
}

local buttons = {
    type = "group",
    val = {
        button("SPC / ", "Search"),
        button("SPC be", "New buffer"),
        button("SPC ff", "Find file"),
        button("SPC qq", "Quit"),
    },
    opts = {
        position = "center",
        spacing = 1,
    },
}

local footer = {
    plugins = {
        type = "text",
        val = "Neovim loaded " .. #vim.tbl_keys(packer_plugins) .. " plugins",
        opts = {
            position = "center",
            hl = "AlphaFooterPlugins",
        },
    },
}

local config = {
    layout = {
        header,
        buttons,
        footer.plugins,
    },
    opts = {},
}

alpha.setup(config)
