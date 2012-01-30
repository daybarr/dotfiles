My dotfiles, mainly used for Ubuntu Linux

# Installation

    git clone git://github.com/daybarr/dotfiles.git ~/dotfiles
    ln -s ~/dotfiles/.{fonts,vim,*rc} ~/

Required for vim plugins:

    sudo pip install pep8

## vim
Plugins managed by [pathogen](https://github.com/tpope/vim-pathogen):

  * [SpaceHi](http://www.vim.org/scripts/script.php?script_id=443): Togglable syntax highlighting of tabs and trailing spaces.
  * [pep8](http://www.vim.org/scripts/script.php?script_id=2914): Check your python source files with PEP8 
    * F5 - run pep8 check against Python file
  * [pyflakes](http://www.vim.org/scripts/script.php?script_id=2441): PyFlakes on-the-fly Python code checking
  * [surround](http://www.vim.org/scripts/script.php?script_id=1697): quoting/parenthesizing made simple
  * [repeat](http://www.vim.org/scripts/script.php?script_id=2136): enable repeating supported plugin maps with "."
  * [python_fn](http://www.vim.org/scripts/script.php?script_id=30): A set of menus/shortcuts to work with Python files
  * [vim-pythontextobj](https://github.com/natw/vim-pythontextobj): specify text object targets for python classes and
functions

## fonts
Incosolata.otf font from
http://www.levien.com/type/myfonts/inconsolata.html

Note this.ttf font from
http://www.dafont.com/note-this.font
