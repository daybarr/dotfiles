"" choose no compatibility with legacy vi
set nocompatible

"" Pathogen - Install plugins from bundle
call pathogen#infect()

syntax enable
set encoding=utf-8
filetype plugin indent on       " load file type plugins + indentation

"" Colors
set background=dark
colorscheme solarized

"" gvim options
if has('gui_running')
    " no toolbar
    set guioptions-=T

    " Disable scrollbars
    " These cause gvim to become "unsnapped" when toggling NERDTree etc as the
    " new scrollbar resizes the window. Let's avoid that.
    set guioptions-=rL

    " Font
    if has('gui_win32')
        set guifont=Consolas:h9:b:cANSI
    endif
endif

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

" Show line numbers
set number

" Enable working on hidden buffers without requiring save before switch
" http://stackoverflow.com/a/103590/445073
set hidden

" Use comma as leader, not backslash which hurts
let mapleader=","

" Command to visually highlight the last inserted text
nmap <leader>v `[v`]

" Toggle gundo (vim undo for humans)
nnoremap <leader>u :GundoToggle<CR>

" Visual autocomplete bar for the command menu
set wildmenu

" Show (partial) command in the last line of the screen.
" Also shows size of selction in visual mode.
set showcmd

""" Status line
" Always show
set laststatus=2

" Content of status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

"" Plugin specific settings
" SpaceHi
autocmd syntax * SpaceHi

" NERDTree
noremap <script> <silent> <unique> <Leader>t :NERDTreeToggle<CR>

" python_pep8
autocmd FileType python map <buffer> <Leader>8 :call Pep8()<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
