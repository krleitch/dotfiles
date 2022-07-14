if !exists('g:loaded_telescope') | finish | endif

lua << EOF
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')
require("telescope").load_extension("ui-select")
require('telescope').load_extension('dap')
EOF

" show hidden files as well
nnoremap <silent> <leader>ff <cmd>Telescope git_files<CR>
" find only files in same directory as current buffer
nnoremap <silent> <leader>fd :lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>
" show git files that edited
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
" show open buffers
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
" git status
nnoremap <silent> <leader>fs <cmd>Telescope git_status<CR>
" current bufferr fuzzy find
nnoremap <silent> <leader>fc <cmd>Telescope current_buffer_fuzzy_find<CR>
" search aerial
nnoremap <silent> <leader>fa <cmd>Telescope aerial<CR>
