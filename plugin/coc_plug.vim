command! -nargs=1 CocPlug call coc_plug#add(<args>)
command! -nargs=0 CocPlugInstall call coc_plug#install()
command! -nargs=0 CocPlugClean call coc_plug#clean()
