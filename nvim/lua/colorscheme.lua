local colorscheme = "onedark"

local status_ok, theme = pcall(require, colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " not found! ")
    return
end

local onedark_cfg = {
    --style = 'dark',
    --style = 'darker',
    --style = 'cool',
    --style = 'deep',
    --style = 'warm',
    style = 'warmer',
    transparent = true,
    lualine = {
        transparent = true
    },
}

theme.setup(onedark_cfg)
theme.load()

