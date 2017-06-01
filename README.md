My dotfiles for Ubuntu Linux

# Installation

    git clone --recursive https://daybarr@github.com/daybarr/dotfiles.git ~/dotfiles
    python ~/dotfiles/setup.py

## vim
Some .vimrc inspiration taken from [Doug Black](http://dougblack.io/words/a-good-vimrc.html)

Plugins managed by [pathogen](https://github.com/tpope/vim-pathogen):

Works best with vim8. To compile on Ubuntu 16.04/16.10:
```
# Get build dependencies.
# Uncomment deb-src lines in /etc/apt/sources.list if it fails
sudo apt build-dep vim

# Get vim and build it
git clone https://github.com/vim/vim.git
cd vim
./configure \
 --enable-multibyte \
 --enable-pythoninterp=yes \
 --enable-cscope \
 --enable-gui=auto \
 --enable-gtk2-check \
 --enable-gnome-check \
 --prefix=/usr \
 --with-x
sudo make distclean
make
sudo make install
```

* [ALE](https://github.com/w0rp/ale): Asynchronous Lint Engine
```
# For Python support
sudo apt install pyflakes pylint

# For JavaScript support:
sudo apt install npm
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
* [undotree](https://github.com/mbbill/undotree): The ultimate undo history visualizer for VIM
* [emmet.vim](http://www.vim.org/scripts/script.php?script_id=2981): for HTML and CSS hi-speed coding

## fonts
* [Inconsolata.otf](http://www.levien.com/type/myfonts/inconsolata.html)
* [Note this.ttf](http://www.dafont.com/note-this.font)

## redshift
A configuration file and autostart for [redshift-gtk](http://jonls.dk/redshift/)
