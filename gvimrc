"When the GUI starts, t_vb is reset to its default value.
"Reassert that no flash or beep is wanted.
set visualbell t_vb=

":map <C-V> "+gP<CR>
":imap <C-V> <ESC>"+gP<CR> A
source $VIMRUNTIME/mswin.vim
behave mswin
