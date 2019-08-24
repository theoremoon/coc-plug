if exists('g:loaded_coc_plug')
  finish
endif


function! s:ListToDictKeys(xs,v)
  let dict={}
  for x in a:xs
    let dict[x]=a:v
  endfor
  return dict
endf

function! coc_plug#init()
  let g:loaded_coc_plug = 1
  let g:coc_plugs_order = []
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
  let args = ['uninstallExtension']
  let installed_list = coc_plug#list_cocplugins()
  let order = s:ListToDictKeys(g:coc_plugs_order, 1)
  for plug in installed_list
    if !has_key(order, plug)
      call add(args, plug)
    endif
  endfor

  call coc#rpc#notify('CocAction', args)
endf

call coc_plug#init()
