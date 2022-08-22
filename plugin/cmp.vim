if !exists('g:loaded_cmp') | finish | endif

set completeopt=menu,menuone,noselect

lua <<EOF

  -- load snippets
  local luasnip = require("luasnip")
  require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})
  require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

  vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

  -- Virtual Text{{{
  local types = require("luasnip.util.types")
  luasnip.config.set_config({
    history = true, --keep around last snippet local to jump back
    updateevents = "TextChanged,TextChangedI", --update changes as you type
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "" } },
        },
      },
      -- [types.insertNode] = {
      -- 	active = {
      -- 		virt_text = { { "●", "GruvboxBlue" } },
      -- 	},
      -- },
    },
  }) --}}}

  -- Setup nvim-cmp.
  -- need to add for autopair
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require'cmp'
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

  -- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

  local lsp_symbols = {
      Text = "   (Text) ",
      Method = "   (Method)",
      Function = "   (Function)",
      Constructor = "   (Constructor)",
      Field = "   (Field)",
      Variable = "   (Variable)",
      Class = "   (Class)",
      Interface = "   (Interface)",
      Module = "   (Module)",
      Property = "   (Property)",
      Unit = "   (Unit)",
      Value = "   (Value)",
      Enum = "   (Enum)",
      Keyword = "   (Keyword)",
      Snippet = "   (Snippet)",
      Color = "   (Color)",
      File = "   (File)",
      Reference = "   (Reference)",
      Folder = "   (Folder)",
      EnumMember = "   (EnumMember)",
      Constant = "   (Constant)",
      Struct = "   (Struct)",
      Event = "   (Event)",
      Operator = "   (Operator)",
      TypeParameter = "   (TypeParameter)",
  }

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[Snippet]"
            })[entry.source.name]
            return item
        end,
    },
    window = {
      completion = {
          border = 'rounded',
          winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
      },
      documentation = {
          border = 'rounded',
          winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
      },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-c>'] = cmp.mapping.abort(),
      ['<C-e>'] = cmp.mapping(function(fallback)
        -- close but i also use C-e to edit end of line in insert mode
        cmp.abort()
        fallback()
      end, { "i", "s"}),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = "nvim_lsp_signature_help" },
      { name = "path" },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF
