function! goto#goto(cmd) abort
  let cmd = substitute(a:cmd,'^\v\s*(verbose\s*)?','verbose ','')
  if cmd !~# 'verbose \v(se%[tl]|fu%[nction]|[nvxsoict]?%[nore]?m%[ap!]|com%[mand]|[ic]?%(nore)?a%[bbreviate])'
    echo "Encountered a problem parsing " . string(a:cmd)
    return
  endif

  let results = trim(execute(cmd))->split("\n")
  let r = #{ title: cmd, items: [] }

  for line in range(1,len(results)-1)
    let test = matchlist(results[line],
      \ '\v^\s+Last set from (.{-}) line (\d+)$')[1:2]

    if len(test) != 2 || index(test,['']) != -1
      continue
    endif

    call add(r.items, #{
      \ text: results[line-1],
      \ filename: expand(test[0]),
      \ lnum: test[1]
      \})
  endfor

  if len(r.items) > 1
    call setqflist([], ' ', r)
    botright cw | cc
  else
    exe 'edit +' . r.items[0].lnum . ' ' . r.items[0].filename
  endif
endfunction
