# gitstandup.vim

This is a simple Neovim plugin to print stuff when `nvim` is starting up.

## Pre-requirements
As this plugin will kind you remember, it needs to have access to an existing [`git standup`](https://github.com/kamranahmedse/git-standup) to work with. If you don't have any install, this plugin will show you how to install it and quit.

## Installation

### NeoBundle

An example of how to load this plugin in NeoBundle:

```VimL
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'leojpod/gitstandup.vim'

    " You probably have a number of other plugins listed here.

    " Add this line to make your new plugin load, assuming you haven't renamed it.
    NeoBundle 'nvim-example-python-plugin'
call neobundle#end()
```

### vim-plug

An example of how to load this plugin using vim-plug:

```VimL
Plug 'leojpod/gitstandup.vim'
```

After running `:PlugInstall`, the files should appear in your `~/.config/nvim/plugged` directory (or whatever path you have configured for plugins).


## How to use it
This plugin is still pretty new and might be extended later on.
At the moment it supports only one command: `:Gstandup` which takes an optional parameter specifying how many days back (the `-d` [option](https://github.com/kamranahmedse/git-standup#options) from git-standup) you would like to fetch for your commits.
