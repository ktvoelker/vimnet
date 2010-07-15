
function DirMode()
  let file = expand("%:p")
  let prev = ""
  while 1
    let prev = file
    let file = fnamemodify(file, ":h")
    if strlen(file) == 0 || file == prev
      break
    endif
    let modefile = file . "/.mode.vim"
    if filereadable(modefile)
      echo "Found " . modefile
      execute "source " . fnameescape(modefile)
      break
    endif
  endwhile
endfunction

