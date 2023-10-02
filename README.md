use `coc_global_extensions`


# coc-plug

A coc extension manager

## Requirements

- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)

## Installation

For [vim-plug](https://github.com/junegunn/vim-plug) users:

```vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'theoldmoon0602/coc-plug'
```

## Usage

You can use coc-plug like a vim-plug. Write down your coc extensions to your vimrc like this.

```vim
call coc_plug#begin()
  CocPlug 'coc-python'
  CocPlug 'coc-fsharp'
call coc_plug#end()
```

- `CocPlugInstall` command installs coc extensions
- `CocPlugClean` command removes unused coc extensions

**Notice**: coc-plug will NOT manage loading extensions. If you remove `CocPlug 'coc-fshar'` and do not run `CocPlugClean`, `coc-fsharp` extension still remains your vim environment and loaded.

## License

MIT
