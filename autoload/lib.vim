" Execute a command, leaving the cursor on the current line
function! lib#InPlace(command)
  let l:saved_view = winsaveview()
  exe a:command
  call winrestview(saved_view)
endfunction
