
if exists('g:loaded_auto_paste_mode')
  finish
endif
let g:loaded_auto_paste_mode = 1

if has('nvim')
  if !has("patch-8.0.0210")
    call auto_paste_mode#set()
  endif
else
  if has("patch-8.0.0238")
    " 8.0.0238 or later version uses Bracketed Paste Mode
    " when the TERM is xterm and nothing is set.
    " When you use tmux, you need the following settings
    " to use Bracketed Paste Mode because TERM is screen.
    if &term =~? 'xterm' || &term =~? 'screen' || &term =~? 'rxvt'
      let &t_BE = "\e[?2004h"
      let &t_BD = "\e[?2004l"
      exec "set t_PS=\e[200~"
      exec "set t_PE=\e[201~"
    endif
  else
    if has("patch-8.0.0210")
      set t_BE=
    endif
    call auto_paste_mode#set()
  endif
endif

