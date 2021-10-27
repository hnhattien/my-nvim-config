vim.cmd(
  [[
let g:VimuxHeight = "20" 
let g:VimuxOrientation = "v" 
let g:VimuxRunnerType = "pane" 
map rr :call VimuxPromptCommand() 
map rl :call VimuxRunLastCommand() 
map rc :call VimuxCloseRunner()

  ]]
)
