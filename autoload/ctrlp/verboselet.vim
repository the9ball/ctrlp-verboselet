if exists('g:loaded_ctrlp_verboselet') && g:loaded_ctrlp_verboselet
  "finish
endif
let g:loaded_ctrlp_verboselet = 1

let s:mark_var = {
\  'init':   'ctrlp#verboselet#init()',
\  'exit':   'ctrlp#verboselet#exit()',
\  'accept': 'ctrlp#verboselet#accept',
\  'lname':  'mark',
\  'sname':  'mark',
\  'type':   'mark',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:mark_var)
else
  let g:ctrlp_ext_vars = [s:mark_var]
endif

function! ctrlp#verboselet#init()
  let s = ''
  redir => s
  silent verbose let
  redir END
  return split(s, "\n")[1:]
endfunc

function! ctrlp#verboselet#accept(mode, str)
  call ctrlp#exit()
endfunction

function! ctrlp#verboselet#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#verboselet#id()
  return s:id
endfunction

