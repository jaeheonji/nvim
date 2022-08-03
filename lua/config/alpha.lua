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

local function version()
    local v = vim.version()
    return string.format("v%d.%d.%d", v.major, v.minor, v.patch)
end

local function dynamic_padding()
    local fn = vim.fn

    local padding = fn.floor(fn.winheight(0) * 0.3)
    return fn.max({ 2, padding })
end

local header = {
    banner = {
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
            hl = "AlphaHeaderBanner",
        },
    },
    text = {
        type = "group",
        val = {
            {
                type = "text",
                val = " ┌──── " .. os.date("Today is %a %d %b") .. " ────┐",
                opts = {
                    position = "center",
                    hl = "AlphaHeaderText",
                },
            },
            {
                type = "text",
                val = "└──────── " .. os.date("%X") .. " ────────┘",
                opts = {
                    position = "center",
                    hl = "AlphaHeaderText",
                },
            },
        },
    },
}

local buttons = {
    type = "group",
    val = {
        button(" SPC /  ", "\u{f15c}  Search"),
        button(" SPC be ", "\u{e23c}  New buffer"),
        button(" SPC ff ", "\u{f002}  Find file"),
        button(" SPC qq ", "\u{f08b}  Quit"),
    },
    opts = {
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
    version = {
        type = "text",
        val = version(),
        opts = {
            position = "center",
            hl = "AlphaFooterVersion",
        },
    },
}

local config = {
    layout = {
        { type = "padding", val = dynamic_padding() },
        header.banner,
        { type = "padding", val = 2 },
        header.text,
        { type = "padding", val = 2 },
        buttons,
        { type = "padding", val = 2 },
        footer.plugins,
        footer.version,
    },
    opts = {},
}

alpha.setup(config)
