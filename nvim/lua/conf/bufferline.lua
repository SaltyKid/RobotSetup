local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("bufferline not found!")
  return
end

local function func_diagnostics_indicator(count, level, diagnostics_dict, context)
    local s = " "
    for e, n in pairs(diagnostics_dict) do
        local sym = (e == "error" and " ") or (e == "warning" and " " or " ")
        s = s .. n .. sym
    end
    return s
end

local bufferline_cfg = {
    options = {
        -- 关闭Tab的命令
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        -- 侧边栏配置
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "directory",
                text_align = "left",
            },
        },
        -- LSP
        diagnostics = "nvim_lsp",
        diagnostics_indicator = func_diagnostics_indicator,
    },
}
bufferline.setup(bufferline_cfg)

