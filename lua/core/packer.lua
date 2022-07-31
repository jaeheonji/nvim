local M = {}

M.setup = function(plugins)
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    local bootstrap
    if fn.empty(fn.glob(install_path)) > 0 then
        bootstrap = fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
    end

    vim.cmd([[ packadd packer.nvim ]])
    local ok, packer = pcall(require, "packer")
    if not ok then
        error("Could not load packer!")
    end

    packer.init({
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    })

    packer.startup(function(use)
        for _, plugin in pairs(plugins) do
            use(plugin)
        end

        if bootstrap then
            packer.sync()
        end
    end)
end

return M
