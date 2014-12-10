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
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " searches are case insensitive...
set smartcase       " ... unless they contain aT least one capital letter

"" Alias anonymous register to + (X11 window clipboard)
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" Requires vim 7.3.74 or higher. Use unnamed for the selection register (*)
" On windows just use * which is the windows clipboard
if has("win32")
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Enable working on hidden buffers without requiring save before switch
" http://stackoverflow.com/a/103590/445073
set hidden

let mapleader=","           " leader is comma, not backslash which hurts

nmap gV `[v`]               " highlight last inserted text

nnoremap <leader>u :GundoToggle<CR> " Toggle gundo (vim undo for humans)

set wildmenu                " visual autocomplete bar for the command menu

"" Plugin specific settings
" SpaceHi
autocmd syntax * SpaceHi

" NERDTree
noremap <script> <silent> <unique> <Leader>t :NERDTreeToggle<CR>

" pep8
let g:pep8_map='<leader>8'
