local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("toggleterm not found!")
  return
end

toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
        end
    end,
    hide_numbers = true, -- hide the number column in toggleterm buffers
    start_in_insert = true,
    --shell = vim.o.shell, -- change the default shell
    float_opts = {
        border = 'curved', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        width = vim.o.columns * 0.8,
        --height = vim.o.lines * 0.5,
        winblend = 0,
    }
})

local Terminal = require("toggleterm.terminal").Terminal

local ta = Terminal:new({
  direction = "float",
  close_on_exit = true,
})

--local tb = Terminal:new({
--  direction = "vertical",
--  close_on_exit = true,
--})
--
--local tc = Terminal:new({
--  direction = "horizontal",
--  close_on_exit = true,
--})

local M = {}

M.toggleA = function()
  if ta:is_open() then
    ta:close()
    return
  end
  ta:open()
end

--M.toggleB = function()
--  if tb:is_open() then
--    tb:close()
--    return
--  end
--  ta:close()
--  tc:close()
--  tb:open()
--end
--
--M.toggleC = function()
--  if tc:is_open() then
--    tc:close()
--    return
--  end
--  ta:close()
--  tb:close()
--  tc:open()
--end

require("keymaps").toggleterm_keymap(M)

