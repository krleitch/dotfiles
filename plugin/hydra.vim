lua << EOF
local Hydra = require("hydra")

-- WINDOWS
Hydra({
   hint = [[
 ^^^^^^     Move     ^^^^^^   ^^     Split         ^^^^    Size
 ^^^^^^--------------^^^^^^   ^^---------------    ^^^^------------- 
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    _s_: horizontally    _+_ _-_: height
 _h_ ^ ^ _l_   _H_ ^ ^ _L_    _v_: vertically      _>_ _<_: width
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    _Q_: close           ^ _=_ ^: equalize
 focus^^^^^^   window^^^^^^
 ^ ^ ^ ^ ^ ^   ^ ^ ^ ^ ^ ^    _b_: choose buffer   _q_: exit
]],
   config = {
      invoke_on_body = true,
      hint = {
         border = 'rounded'
      }
   },
   mode = 'n',
   body = '<leader><C-w>',
   heads = {
      -- Move focus
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', '<C-w>k' },
      { 'l', '<C-w>l' },
      -- Move window
      { 'H', '<Cmd>WinShift left<CR>' },
      { 'J', '<Cmd>WinShift down<CR>' },
      { 'K', '<Cmd>WinShift up<CR>' },
      { 'L', '<Cmd>WinShift right<CR>' },
      -- Split
      { 's', '<C-w>s' },
      { 'v', '<C-w>v' },
      { 'Q', '<Cmd>try | close | catch | endtry<CR>', { desc = 'close window' } },
      -- Size
      { '+', '<C-w>+' },
      { '-', '<C-w>-' },
      { '>', '2<C-w>>', { desc = 'increase width' } },
      { '<', '2<C-w><', { desc = 'decrease width' } },
      { '=', '<C-w>=', { desc = 'equalize'} },
      --
      { 'b', '<Cmd>BufExplorer<CR>', { exit = true, desc = 'choose buffer' } },
      { 'q', nil,  { exit = true }}
   }
})

-- GIT
local gitsigns = require('gitsigns')
Hydra({
   hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full 
 ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _q_: exit
]],
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
      on_enter = function()
         vim.bo.modifiable = false
         gitsigns.toggle_signs(true)
         gitsigns.toggle_linehl(true)
      end,
      on_exit = function()
         gitsigns.toggle_signs(false)
         gitsigns.toggle_linehl(false)
         gitsigns.toggle_deleted(false)
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = '<leader>g',
   heads = {
      { 'J', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gitsigns.next_hunk() end)
            return '<Ignore>'
         end, { expr = true } },
      { 'K', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return '<Ignore>'
         end, { expr = true } },
      { 's', ':Gitsigns stage_hunk<CR>', { silent = true } },
      { 'u', gitsigns.undo_stage_hunk },
      { 'S', gitsigns.stage_buffer },
      { 'p', gitsigns.preview_hunk },
      { 'd', gitsigns.toggle_deleted, { nowait = true } },
      { 'b', gitsigns.blame_line },
      { 'B', function() gitsigns.blame_line{ full = true } end },
      { '/', gitsigns.show, { exit = true } }, -- show the base of the file
      { '<Enter>', '<cmd>Neogit<CR>', { exit = true } },
      { 'q', nil, { exit = true, nowait = true } },
   }
})

-- Aerial
Hydra({
   hint = [[
 _o_: open cur      _}_: next f()      _[_: Up level         _t_: toggle
 _O_: open all      _{_: prev f()      _]_: Down level       ^ ^
 _c_: close cur     ^ ^                ^ ^                   ^ ^
 _C_: close all     ^ ^                ^ ^                   _q_: exit
]],
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
      on_enter = function()
         vim.cmd 'AerialOpen!'
      end,
      on_exit = function()
         vim.cmd 'AerialCloseAll' -- clear the echo area
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = '<leader>a',
   heads = {
      { 'o', '<cmd>AerialTreeOpen!<CR>', { silent = true } },
      { 'c', '<cmd>AerialTreeClose!<CR>', { silent = true } },
      { 'O', '<cmd>AerialTreeOpenAll<CR>', { silent = true } },
      { 'C', '<cmd>AerialTreeCloseAll<CR>', { silent = true } },
      { 't', '<cmd>AerialToggle!<CR>', { silent = true } },
      { '{', '<cmd>AerialPrev<CR>', { silent = true } },
      { '}', '<cmd>AerialNext<CR>', { silent = true } },
      { '[', '<cmd>AerialPrevUp<CR>', { silent = true } },
      { ']', '<cmd>AerialNextUp<CR>', { silent = true } },
      { 'q', nil, { exit = true, nowait = true } },
   }
})

-- Trouble
Hydra({
   hint = [[
  DIAGNOSTICS
 ---------------^ ^
 _x_: toggle
 _w_: workspace
 _d_: diagnostics
 ^ ^
 _f_: quick fix
 _l_: loc list
 ^ ^
 _}_: next diag
 _{_: prev diag
 _]_: next err
 _[_: prev err
 ^ ^
 _q_: exit
]],
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'middle-right',
         border = 'rounded'
      },
   },
   mode = {'n','x'},
   body = '<leader>x',
   heads = {
      { 'x', '<cmd>TroubleToggle<CR>', { silent = true } },
      { 'w', '<cmd>Trouble workspace_diagnostics<CR>', { silent = true } },
      { 'd', '<cmd>Trouble document_diagnostics<CR>', { silent = true } },
      { 'f', '<cmd>Trouble quickfix<CR>', { silent = true } },
      { 'l', '<cmd>Trouble loclist<CR>', { silent = true } },
      { '{', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true } },
      { '}', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true } },
      { '[', '<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>', { silent = true } },
      { ']', '<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>', { silent = true } },
      { 'q', nil, { exit = true, nowait = true } },
   }
})

-- DAP
Hydra({
   hint = [[
  DEBUG 
 ----------------^ ^
 _c_: continue
 _v_: step over
 _i_: step into
 _o_: step out
 ^ ^
 _b_: toggle break
 _B_: set break
 _p_: set log break
 ^ ^
 _u_: toggle ui
 _h_: visual hover
 _l_: run last
 ^ ^
 _q_: exit
]],
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'middle-right',
         border = 'rounded'
      },
      on_exit = function()
         vim.cmd 'lua require(\'dapui\').close()' -- clear the echo area
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = '<leader>d',
   heads = {
      { 'c', ':lua require\'dap\'.continue()<CR>', { silent = true } },
      { 'v', ':lua require\'dap\'.step_over()<CR>', { silent = true } },
      { 'i', ':lua require\'dap\'.step_into()<CR>', { silent = true } },
      { 'o', ':lua require\'dap\'.step_out()<CR>', { silent = true } },
      { 'b', ':lua require\'dap\'.toggle_breakpoint()<CR>', { silent = true } },
      { 'B', ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', { silent = true } },
      { 'p', ':lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', { silent = true } },
      { 'u', ':lua require\'dapui\'.toggle()<CR>', { silent = true } },
      { 'h', ':lua require\'dap.ui.variables\'.visual_hover()<CR>', { silent = true } },
      { 'l', ':lua require\'dap\'.repl.run_last()<CR>', { silent = true } },
      { 'q', nil, { exit = true, nowait = true } },
   }
})

EOF
