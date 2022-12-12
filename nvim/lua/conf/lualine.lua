local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine not found!")
  return
end

local lualine_cfg = {
    options = {
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    extensions = { "nvim-tree", "toggleterm" },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', { 'lsp_progress', spinner_symbols = { " ", " ", " ", " ", " ", " " }, }, 'filesize' },
        lualine_x = { 'progress', 'encoding', { 'fileformat', symbols = { unix = 'LF', dos = 'CRCF', max = 'CR' }, }, 'filetype', },
        --lualine_x = {'encoding'},
        lualine_y = {},
        --lualine_y = {'progress'},
        --lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        --lualine_c = {'filename'},
        --lualine_x = {'location'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}
lualine.setup(lualine_cfg)

