if &cp || exists("loaded_vim_goto")
    finish
endif
let loaded_vim_goto = 1
let s:save_cpo = &cpo
set cpo&vim

command! -complete=command -nargs=1 Goto call goto#goto(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
