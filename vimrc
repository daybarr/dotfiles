"" choose no compatibility with legacy vi
set nocompatible

"" Pathogen - Install plugins from bundle
call pathogen#infect()

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

colorscheme koehler
set number

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " searches are case insensitive...
set smartcase       " ... unless they contain aT least one capital letter

"" Plugin specific settings
" SpaceHi
autocmd syntax * SpaceHi

" pylint
autocmd FileType python compiler pylint
" don't auto open quickfix window
let g:pylint_cwindow = 0
