set tabstop=8
set shiftwidth=4
set softtabstop=4

set sidescroll=1

set colorcolumn=81
set nowrap
set ruler

syntax on
set background=dark
colorscheme solarized

set mouse=a
set backspace=indent,eol,start

set showtabline=2

filetype plugin on
filetype plugin indent on

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <F2> Nzz
nnoremap <F3> nzz

if match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0
    set t_Co=256
endif
