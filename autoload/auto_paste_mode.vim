function! auto_paste_mode#set() abort
  if &term =~? 'xterm' || &term =~? 'screen' || &term =~? 'rxvt'
    " let &t_SI .= "\<Esc>[?2004h"
    " let &t_EI .= "\<Esc>[?2004l"
    let &t_ti .= "\<Esc>[?2004h"
    let &t_te .= "\<Esc>[?2004l"

    function! s:XTermPasteBegin(ret) abort
      set pastetoggle=<f29>
      set paste
      return a:ret
    endfunction

    execute "set <f28>=\<Esc>[200~"
    execute "set <f29>=\<Esc>[201~"
    "map <expr> <f28> <SID>XTermPasteBegin("i")
    imap <expr> <f28> <SID>XTermPasteBegin("<C-g>u")
    "vmap <expr> <f28> <SID>XTermPasteBegin("c")
    cmap <f28> <nop>
    cmap <f29> <nop>
  endif
endfunction

