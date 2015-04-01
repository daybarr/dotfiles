My dotfiles for Ubuntu Linux

# Installation

    git clone https://daybarr@github.com/daybarr/dotfiles.git ~/dotfiles
    ~/dotfiles/setup.py

## vim
Some .vimrc inspiration taken from [Doug Black](http://dougblack.io/words/a-good-vimrc.html)

Plugins managed by [pathogen](https://github.com/tpope/vim-pathogen):

* [Syntastic](https://github.com/scrooloose/syntastic): Syntax checking plugin
```
# For Python support
sudo apt-get install pyflakes

# For JavaScript support:
sudo apt-get install npm
sudo npm install jshint jscs -g
```
* [python_pep8](http://www.vim.org/scripts/script.php?script_id=3160): Check your python source files with PEP8
```
sudo pip install pep8
```
* [SpaceHi](http://www.vim.org/scripts/script.php?script_id=443): Togglable syntax highlighting of tabs and trailing spaces
* [surround](http://www.vim.org/scripts/script.php?script_id=1697): quoting/parenthesizing made simple
* [repeat](http://www.vim.org/scripts/script.php?script_id=2136): enable repeating supported plugin maps with "."
* [python_fn](http://www.vim.org/scripts/script.php?script_id=30): A set of menus/shortcuts to work with Python files
* [vim-pythontextobj](https://github.com/natw/vim-pythontextobj): specify text object targets for python classes and functions
* [better_python](http://www.vim.org/scripts/script.php?script_id=974): handle continuation lines better than vim defaults
* [bufexplorer](http://www.vim.org/scripts/script.php?script_id=42): quickly and easily switch between buffers
* [The NERD tree](http://www.vim.org/scripts/script.php?script_id=1658): explore your filesystem to open files and directories
* [gundo](http://www.vim.org/scripts/script.php?script_id=1658): making vim's undo tree usable by humans
* [emmet.vim](http://www.vim.org/scripts/script.php?script_id=2981): for HTML and CSS hi-speed coding

## fonts
* [Inconsolata.otf](http://www.levien.com/type/myfonts/inconsolata.html)
* [Note this.ttf](http://www.dafont.com/note-this.font)

## redshift
A configuration file and autostart for [redshift-gtk](http://jonls.dk/redshift/)
