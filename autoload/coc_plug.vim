if exists('g:loaded_coc_plug')
  finish
endif
let g:loaded_coc_plug = 1


function! s:ListToDictKeys(xs,v)
  let dict={}
  for x in a:xs
    let dict[x]=a:v
  endfor
  return dict
endf

function! coc_plug#begin()
  let g:coc_plugs_order = []

  command! -nargs=1 CocPlug call coc_plug#add(<args>)
  command! -nargs=0 CocPlugList echo g:coc_plugs_order
  command! -nargs=0 CocPlugInstall call coc_plug#install()
  command! -nargs=0 CocPlugClean call coc_plug#clean()
endf

function! coc_plug#end()
endf

function! coc_plug#add(plug)
  call add(g:coc_plugs_order, a:plug)
endf

function! coc_plug#list_cocplugins()
  let stats = CocAction('extensionStats')
  call filter(stats, 'v:val["isLocal"] == v:false')
  let list = map(stats, 'v:val["id"]')
  return list
endf

function! coc_plug#install()
  let args = []
  let installed_list = coc_plug#list_cocplugins()
  let installed = s:ListToDictKeys(installed_list, 1)
  for plug in g:coc_plugs_order
    if !has_key(installed, plug)
      call add(args, plug)
    endif
  endfor

  call coc#util#install_extension(args)
endf

function! coc_plug#clean()
  let args = []
  let installed_list = coc_plug#list_cocplugins()
  let order = s:ListToDictKeys(g:coc_plugs_order, 1)
  for plug in installed_list
    if !has_key(order, plug)
      call add(args, plug)
    endif
  endfor

  call CocActionAsync(args)
endf

