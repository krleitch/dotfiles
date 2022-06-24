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
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')
EOF

" if we are using fzf then dont override its keybindings
if exists('g:loaded_fzf_vim') | finish | endif

" show hidden files as well
nnoremap <C-p> :lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", {noremap = true, silent = true})
" find only files in same directory as current buffer
nnoremap <silent> <leader>ff :lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>
" show git files that edited
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
" show open buffers
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
" show help tags
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<CR>
" git status
nnoremap <silent> <leader>fs <cmd>Telescope git_status<CR>
" current bufferr fuzzy find
nnoremap <silent> <leader>fc <cmd>Telescope current_buffer_fuzzy_find<CR>
" search aerial
nnoremap <silent> <leader>fa <cmd>Telescope aerial<CR>
