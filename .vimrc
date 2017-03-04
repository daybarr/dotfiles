"" choose no compatibility with legacy vi
set nocompatible

if has("win32")
    "sorry
    set shell=\"\"C:\Program\ Files\Git\bin\bash.exe\"
    "set shellslash
    "let $SHELL='C:/tools/bash.exe'
    "set shell=\"\"C:\tools\bash.exe\"
    "set shellredir=>%s\ 2>&1
    "set shellpipe=2>&1\|\ tee
    "set shellcmdflag=-c
    "set shellquote=
    "set shellxquote=\"
    "set shellslash
endif
set runtimepath +=~/dev/dotfiles/.vim

"" Pathogen - Install plugins from bundle
call pathogen#infect()

syntax enable
set encoding=utf-8
filetype plugin indent on       " load file type plugins + indentation

"" Colors
set background=dark
if !has('gui_running')
    "echomsg "Found: Terminal" &term "with" &t_Co "colors"
    if empty($CONEMUBUILD)
        if $COLORTERM == 'gnome-terminal' || $TERM == 'xterm-256color'
            set t_Co=256
        endif
    else
        " Hack for ConEmu on windows courtesy of
        " http://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
        " plus extra hackery
        if has('builtin_terms') && ((&term == "pcterm") || (&term == "win32"))
                "echomsg "Trying to set ANSI 256-color terminal"
                set term=pcansi t_Co=256
"                let &t_AB = "\e[48;5;%dm"
"                let &t_AF = "\e[38;5;%dm"
                "echomsg "Result: Terminal" &term "with" &t_Co "colors"
        endif
    endif

    if &t_Co == "256"
        "echomsg "Telling solarized we have 256 colors"
        let g:solarized_termcolors=256
    endif
endif
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
    set clipboard^=unnamedplus
endif

" Use forward slashes when expanding file names on windows where we use bash
" as our shell
if has("win32")
    set shellslash
endif

" Show line numbers
set number

" Highlight line with the cursor
set cursorline

" Enable working on hidden buffers without requiring save before switch
" http://stackoverflow.com/a/103590/445073
set hidden

" Use comma as leader, not backslash which hurts
let mapleader=","

" Command to visually highlight the last inserted text
nmap <leader>v `[v`]

" Remove all trailing whitespace
nnoremap <leader>s :%s/\s\+$//<CR>

" Next in location list
nnoremap <leader>n :lne<CR>
" Prevoius
nnoremap <leader>p :lpre<CR>

" Open current buffer in Windows Explorer
if has("win32")
    nnoremap <leader>e :!explorer "/select,$(cygpath -wa '%')"<CR>
endif

" Visual autocomplete bar for the command menu
set wildmenu

" Show (partial) command in the last line of the screen.
" Also shows size of selction in visual mode.
" Disabled to speed up redraw on scroll for Windoze where terminals are slow
if has("win32")
    set noshowcmd
else
    set showcmd
endif

" Increase and decrease window size in chunks instead of one row/col at a time
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

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
set statusline +=%1*%=                  "switch to right
set statusline +=%5l%*                  "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

"" Plugin specific settings
" SpaceHi
autocmd syntax * SpaceHi

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" NERDTree
noremap <script> <silent> <unique> <Leader>t :NERDTreeToggle<CR>
noremap <script> <silent> <unique> <Leader>f :NERDTreeFind<CR>

" Filter out . and .. directory entries - for when we view hidden files
" (shift+i) in NERDTree window.
" Also filter out any .foo.swp for files being edited.
" Binary .pyc and .pyo files for python.
let NERDTreeIgnore=['\.$', '\.\.$', '\..*\.swp$', '.py[co]$']

" python_pep8
autocmd FileType python map <buffer> <Leader>8 :call Pep8()<CR>
