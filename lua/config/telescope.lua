local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local actions = require("telescope.actions")

local settings = require("core.utils").override("telescope", {
    defaults = {
        -- ripgrep remove indentation
        -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ripgrep-remove-indentation
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
            vertical = {
                height = 0.8,
                width = 0.55,

                preview_height = 0.7,
            },
        },
        mappings = {
            i = { ["<ESC>"] = actions.close },
        },
    },
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor({
                borderchars = {
                    { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                    results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
            }),
        },
        ["file_browser"] = {
            theme = "ivy",
            initial_mode = "normal",
            mappings = {
                i = { ["<ESC>"] = false },
            },
        },
    },
})

telescope.setup(settings)
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("project")
