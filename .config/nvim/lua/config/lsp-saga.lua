local saga = require('lspsaga')

saga.init_lsp_saga{
-- add your config value here
-- default value

 use_saga_diagnostic_sign = true,
 error_sign = 'ﴫ',
 warn_sign = '',
-- hint_sign = '',
 infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
 code_action_prompt = {
   enable = true,
   sign = true,
   sign_priority = 20,
   virtual_text = true,
 },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
 border_style = "round"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}
}

local map = vim.api.nvim_set_keymap
-- lsp provider to find the cursor word definition and reference
--map('n','gh','<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>', {noremap= true, silent= true})
-- or use command LspSagaFinder
map('n','gh',':Lspsaga lsp_finder<CR>',{noremap= true, silent= true})

-- code action
--map('n','ca','<cmd>lua require('lspsaga.codeaction').code_action()<CR>',{noremap= true, silent= true, leader= true})
--map('v','ca :<C-U> lua require('lspsaga.codeaction').range_code_action()<CR>',{vnoremap= true, silent= true, leader= true})
-- or use command

map('n','<leader>ca',':Lspsaga code_action<CR>',{noremap= true, silent= true})
--noremap <silent><leader>ca :Lspsaga code_action<CR>
map('v','<leader>ca',':<C-U>Lspsaga range_code_action<CR>',{noremap= true, silent= true})
--vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

-- show hover doc
-- or use command
--noremap <silent>K :Lspsaga hover_doc<CR>
map('n','K',' :Lspsaga hover_doc<CR>',{noremap= true, silent= true})


-- scroll down hover doc or scroll in definition preview
--noremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
map('n','<C-f>','<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',{silent= true, expr=true})
-- scroll up hover doc
map('n','<C-b>','<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {silent= true, expr= true})
--noremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

-- show signature help
--map('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', {noremap= true , silent= true})
-- or command
map('n','sh',':Lspsaga signature_help<CR>', {noremap= true,silent= true})
--and you also can use smart_scroll_with_saga to scroll in signature help win

-- rename
--noremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
-- or command
--noremap <silent>gr :Lspsaga rename<CR>
map('n','gr',':Lspsaga rename<CR>', {noremap= true, silent= true})
-- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

-- preview definition
--noremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
-- or use command
--noremap <silent> gd :Lspsaga preview_definition<CR>
map('n','gd',':Lspsaga preview_definition<CR>',{noremap= true, silent= true})

--can use smart_scroll_with_saga to scroll


-- show
--noremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
--noremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
map('n','<leader>cd',':Lspsaga show_line_diagnostics<CR>', {noremap= true, silent= true})

-- only show diagnostic if cursor is over the area
--noremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
map('n','<leader>cc', '<cmd>lua require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>', {noremap= true, silent= true, expr= true})

-- jump diagnostic
map('n','[e', ':Lspsaga diagnostic_jump_next<CR>', {noremap= true, silent= true})
map('n',']e',':Lspsaga diagnostic_jump_prev<CR>', {noremap= true, silent= true})

-- float terminal also you can pass the cli command in open_float_terminal function
-- or use command
map('n','<A-d>',':Lspsaga open_floaterm<CR>',{noremap= true, silent= true})
map('t','<A-d>','<C-\\><C-n>:Lspsaga close_floaterm<CR>',{noremap= true, silent= true})


