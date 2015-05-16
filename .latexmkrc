$pdf_previewer = "start xpdf -remote %R %O %S";
$pdf_update_method = 4;
$pdf_update_command = "xpdf -remote %R -reload";

# glossaries package support
add_cus_dep( 'glo', 'gls', 0, 'makeglo2gls' );
sub makeglo2gls {
    system( "openout_any=r makeindex -s \"$_[0].ist\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0].glo\"" );
}

add_cus_dep( 'acn', 'acr', 0, 'makeacn2acr' );
sub makeacn2acr {
    system( "openout_any=r makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"" );
}
