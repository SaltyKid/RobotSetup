
--vim.api.nvim_create_autocmd('TextYankPost',{
--  callback = function()
--    vim.highlight.on_yank {
--      higroup = 'IncSearch',
--      timeout = 300
--    }
--  end,
--})

require('onedark').setup {
    --style = 'dark',
    --style = 'darker',
    --style = 'cool',
    --style = 'deep',
    --style = 'warm',
    style = 'warmer',
    transparent = true,
    lualine = {
      transparent = false,
    },
}
require('onedark').load()

