set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" remap jj to exit from terminal mode
:tnoremap jj <C-\><C-n>
