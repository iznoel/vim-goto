vim-Goto
========

vim-goto adds a single command that jumps you to the definition of functions, mappings, settings, etc

## Commands

- `Goto ([set|function|map|command|abbrev] WORD)`

## Examples

```vim
:Goto map ga
" where 'ga' was mapped.

:Goto <Plug>(LiveEasyAlign)
" Where the <Plug> remap was defined.

:Goto map <buffer>
" A quickfix listing all buffer-local mappings.

:Goto function QFdelete
" The Definition of a function.

:Goto setl ft
" The condition that defined the filetype.

:Goto fun db_ui#statusline
" Autoload functions.
```

## Note

- neovim support is not planned.
- lambdas and funcrefs are not supported.
