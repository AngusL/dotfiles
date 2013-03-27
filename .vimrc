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
set splitright
set splitbelow

set nohlsearch

au! BufWritePost * mkview
au! BufReadPost  * silent loadview

set autochdir
set tags+=.tags;

filetype plugin on
filetype plugin indent on

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap / /\v
vnoremap / <ESC>/\%V\v

cnoremap s/ s/\v

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

nnoremap <F11> :call ToggleBookView()<CR>
let $book_view = 0
function! ToggleBookView()
    if $book_view == 0
	let top = line("w$")
	vsplit

	execute ":" . top
	normal zt

	windo setlocal scrollbind
	let $book_view = 1
    else
	q
	setlocal noscrollbind
	let $book_view = 0
    end
endfunction

set ttymouse=xterm2
