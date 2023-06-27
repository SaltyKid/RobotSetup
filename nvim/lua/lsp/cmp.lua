-- Set up nvim-cmp.
local cmp = require("cmp")

local cmp_config = {
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
          -- For `vsnip` users.
          vim.fn["vsnip#anonymous"](args.body)

          -- For `luasnip` users.
          -- require('luasnip').lsp_expand(args.body)

          -- For `ultisnips` users.
          -- vim.fn["UltiSnips#Anon"](args.body)

          -- For `snippy` users.
          -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- 来源
    sources = cmp.config.sources(
    {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        -- For vsnip users.
        { name = "vsnip" },
        { name = "buffer" },
        -- For luasnip users.
        -- { name = 'luasnip' },
        --For ultisnips users.
        -- { name = 'ultisnips' },
        -- -- For snippy users.
        -- { name = 'snippy' },
        { name = "path" },
    }),
    -- 快捷键
    mapping = require("keymaps").lspcmp(cmp),
    -- 类型图标
    formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        kind_icons = {
            Class = " ",
            Color = " ",
            Constant = "ﲀ ",
            Constructor = " ",
            Enum = "練",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = "",
            Folder = " ",
            Function = " ",
            Interface = "ﰮ ",
            Keyword = " ",
            Method = " ",
            Module = " ",
            Operator = "",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = "塞",
            Value = " ",
            Variable = " ",
        },
        source_names = {
            nvim_lsp = "(LSP)",
            treesitter = "(TS)",
            emoji = "(Emoji)",
            path = "(Path)",
            calc = "(Calc)",
            cmp_tabnine = "(Tabnine)",
            vsnip = "(Snippet)",
            luasnip = "(Snippet)",
            buffer = "(Buffer)",
            spell = "(Spell)",
        },
        duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            vsnip = 1,
            luasnip = 1,
        },
        duplicates_default = 0,
    },
}

local function lspfmt(entry, vim_item)
    local max_width = cmp_config.formatting.max_width
    if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
    end
    vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
    vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
    vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
        or cmp_config.formatting.duplicates_default
    return vim_item
end
cmp_config.formatting.format = lspfmt

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  })
})

cmp.setup(cmp_config)

