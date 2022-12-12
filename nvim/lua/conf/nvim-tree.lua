local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found !")
  return
end

local nvimtree_cfg = {
    --sort_by = "case_sensitive",
    -- 显示git 状态
    git = {
        enable = true,
    },
    view = {
        adaptive_size = true,
        -- 自定义快捷键
        mappings = {
            custom_only = false,
            list = require('keymaps').nvimtree_keymap,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    renderer = {
        group_empty = true,
    },
    -- 不隐藏 . 文件
    filters = {
        dotfiles = false,
    },
    -- 动作
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        }
    }
}

nvimtree.setup(nvimtree_cfg)

