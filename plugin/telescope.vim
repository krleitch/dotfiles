if !exists('g:loaded_telescope') | finish | endif

lua << EOF
require('telescope').setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    path_display = { "truncate" },
     layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  },
  extensions_list = { "themes", "terms" },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')
require("telescope").load_extension("ui-select")
require('telescope').load_extension('dap')
EOF

" show hidden files as well
nnoremap <silent> <C-e>e <CMD>lua require'telescope-config'.project_files()<CR>
" find only files in same directory as current buffer
nnoremap <silent> <C-e>d :lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>
" show git files that edited
nnoremap <silent> <C-e>g <cmd>Telescope live_grep<CR>
" show open buffers
nnoremap <silent> <C-e>b <cmd>Telescope buffers<CR>
" git status
nnoremap <silent> <C-e>s <cmd>Telescope git_status<CR>
" current bufferr fuzzy find
nnoremap <silent> <C-e>/ <cmd>Telescope current_buffer_fuzzy_find<CR>
" search aerial
nnoremap <silent> <C-e>a <cmd>Telescope aerial<CR>

augroup TelescopeCursorLine
  autocmd!
  autocmd FileType TelescopePrompt setlocal nocursorline			
augroup END
