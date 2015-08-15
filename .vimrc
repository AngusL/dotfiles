let mapleader=","

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set viewdir=~/.vim.d/view
let g:netrw_home=expand("$HOME/.vim.d")

highlight link EasyMotionShade  Comment
let g:EasyMotion_leader_key='<Leader>'

set tabstop=8
set shiftwidth=4
set softtabstop=4

set nojoinspaces

set sidescroll=1

set colorcolumn=81
set nowrap
set ruler

syntax on
set background=dark
colorscheme solarized

set mouse=a
set backspace=indent,eol,start

set showcmd

set showtabline=2
set splitright
set splitbelow

set nohlsearch

au! BufWinLeave ?* mkview
au! BufWinEnter ?* silent loadview

set autochdir
set tags+=.tags;

filetype plugin on
filetype plugin indent on

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap ? ?\v
nnoremap / /\v

vnoremap / <ESC>/\%V\v
vnoremap ? <ESC>?\%V\v

cnoremap %s/ %s/\v

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

set pastetoggle=<F9>

set ttymouse=xterm2
