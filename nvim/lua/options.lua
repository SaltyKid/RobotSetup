-- 使用相对行号
vim.opt.number = true
vim.opt.relativenumber = true
-- jk移动时光标下上方保留5行
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
-- 命令行高为2，提供足够的显示空间
vim.opt.cmdheight = 2
vim.opt.showcmd = true
vim.opt.showmode = true
-- 显示匹配的括号
vim.opt.showmatch = true
-- 样式
vim.opt.cursorline = true
vim.opt.termguicolors = true
-- 禁止折行
vim.opt.wrap = false
vim.wo.wrap = false
-- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
-- 搜索
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 鼠标支持
vim.opt.mouse = 'a'
vim.opt.clipboard:append ("unnamedplus")
-- 新行对齐当前行，空格替代tab
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.bo.tabstop = 4
vim.bo.expandtab = true
-- >> << 时移动长度
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- utf8
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
vim.bo.autoread = true
-- 显示左侧图标指示列
vim.wo.signcolumn = 'no'
-- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.list = true
vim.opt.listchars = "space:·"
