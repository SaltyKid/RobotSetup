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

-- 分屏--
keymap("n", "s", "<Nop>", opts)
keymap("n", "<space>", "<Nop>", opts)
keymap("n", "sv", ":vsp<CR>", opts)
keymap("n", "sd", ":sp<CR>", opts)
keymap("n", "sc", "<C-w>c", opts)
keymap("n", "so", "<C-w>o", opts) -- close others
keymap("n", "<space>h", "<C-w>h", opts)
keymap("n", "<space>j", "<C-w>j", opts)
keymap("n", "<space>k", "<C-w>k", opts)
keymap("n", "<space>l", "<C-w>l", opts)
-- 比例控制（不常用，因为支持鼠标拖拽）
keymap("n", "s[", ":vertical resize +20<CR>", opts)
keymap("n", "s]", ":vertical resize -20<CR>", opts)
keymap("n", "s=", "<C-w>=", opts)
keymap("n", "<C-Up>", ":resize +10<CR>",opts)
keymap("n", "<C-Down>", ":resize -10<CR>",opts)

-- terminal
keymap("n", "<C-j>", ":terminal<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)


-- plugin_keymaps --
local plugin_keymaps = {}

-- treesitter 
keymap("n", "zz", ":foldclose<CR>", opts)
keymap("n", "Z", ":foldopen<CR>", opts)

-- bufferline
keymap("n", "<space>bl", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<space>bh", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<space>cc", ":bdelete!<CR>", opts)
keymap("n", "<space>ch", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<space>cl", ":BufferLineCloseLeft<CR>", opts)

-- translator
keymap("n", "<C-t>", ":TranslateW<CR>", opts)

-- FileExpoler
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
plugin_keymaps.nvimtree_keymap = {
    -- 打开文件或文件夹
    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
}

-- Telescope
-- 查找文件
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
-- 全局搜索
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)
-- Telescope 列表 插入模式快捷键
plugin_keymaps.telescope_keymap = {
  i = {
    -- 上下移动
    ["<A-j>"] = "move_selection_next",
    ["<A-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- LSP Basic
plugin_keymaps.lspkeymap = function (mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
end

-- LSP CMP
plugin_keymaps.lspcmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 上一个
    ["<A-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<A-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- snippets 跳转
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end


return plugin_keymaps
