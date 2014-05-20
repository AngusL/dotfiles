au BufNewFile,BufRead *.exp set filetype=tcl

au BufRead * if search('exec .*/bin/tclsh\s.*') | set filetype=tcl | endif
au BufRead * if search('exec .*expect\s.*') | set filetype=tcl | endif
au BufRead * if search('#!\/.*tclsh') | set filetype=tcl | endif
au BufRead * if search('#!\/.*expect') | set filetype=tcl | endif
