local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

-- Normal --
-- Better window natigation
keymap('n','<leader>q','<Cmd>q<CR>', opts)
keymap('n','<leader>w','<Cmd>w<CR>', opts)
keymap('n','<leader>x','<Cmd>wq<CR>', opts)

-- FileExpoler
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- 分屏--
keymap("n", "sv", ":vsp<CR>", opts)
keymap("n", "sd", ":sp<CR>", opts)
keymap("n", "sc", "<C-w>c", opts)
keymap("n", "so", "<C-w>o", opts) -- close others
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
-- 比例控制（不常用，因为支持鼠标拖拽）
keymap("n", "sh", ":vertical resize +20<CR>", opts)
keymap("n", "sl", ":vertical resize -20<CR>", opts)
keymap("n", "s=", "<C-w>=", opts)
keymap("n", "sj", ":resize +10<CR>",opts)
keymap("n", "sk", ":resize -10<CR>",opts)

