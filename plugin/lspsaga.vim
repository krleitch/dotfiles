if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}
-- saga.init_lsp_saga()
EOF

" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
" signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" find the cursor word definition and reference
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
" keymaps for jump diagnostic
nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>
" rename
nnoremap <silent>gr :Lspsaga rename<CR>

" diagnostic  colours
hi DiagnosticError guifg=#ff005f
hi DiagnosticWarn guifg=#d7ff00
hi DiagnosticInfo guifg=#00d7ff
hi DiagnosticHint guifg=#d7875f

