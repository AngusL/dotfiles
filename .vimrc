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

au! BufWritePost * mkview
au! BufReadPost  * silent loadview

filetype plugin on
filetype plugin indent on

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <F2> Nzz
nnoremap <F3> nzz
nnoremap <F4> :call ToggleHexView()<CR>
 
let $hex_view = 0
function! ToggleHexView()
    setlocal binary
    setlocal noeol
    if $hex_view == 0
        :%!xxd
        setlocal syntax=xxd
        let $hex_view = 1
    else
        :%!xxd -r
        setlocal syntax=
        let $hex_view = 0
    endif
endfunction

if match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0
    set t_Co=256
endif
