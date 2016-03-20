"vim config
"editor defaults
set number		"line numbers
syntax enable	"syntax highlighting
set fileformat=unix	"sane text files
set encoding=utf-8
set tabstop=4		"sane editing
set shiftwidth=4
set softtabstop=4

"key re-binds
inoremap <c-space> <c-n> "autocompletion with ctrl+space
inoremap <Nul> <c-n>
"ctags binding to F12
map <f12> :!ctags -R .<cr>
"sipmlernote
cmap Sn Simplenote -
"save files as sudo even if not started as sudo
cmap w!! w !sudo tee > /dev/null %
"F4 toggles search highlighting and show current value
:nnoremap <F4> :set hlsearch! hlsearch?<CR>

"vundle specific settings 
set nocompatible	"be iMproved
filetype off		"required! for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

"my Bundles here:
"
"original repos on github
" css3 syntax
Bundle 'hail2u/vim-css3-syntax' 
" adds stuff around stuff
Bundle 'tpope/vim-surround'
" quick 'n ez html
Bundle 'rstacruz/sparkup'
" syntastic syntax highlighter
Bundle 'scrooloose/syntastic'
" debugger
Bundle 'joonty/vdebug.git'
" auto-close brackets, parens, etc.
Bundle 'Raimondi/delimitMate.git'
" file browsing
Bundle 'scrooloose/nerdtree'
" themes
"Bundle 'freeo/vim-kalisi'
"Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
" vimwiki is best wiki
Bundle 'vimwiki/vimwiki'
"clojure tools
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-fireplace'
" yaml support
Bundle 'stephpy/vim-yaml'
" simplenote plugin
Bundle 'mrtazz/simplenote.vim' 

"vim-scripts repos
"Bundle 'vimwiki'
"non github repos
"eg: git://git.wincent.com/command-t.git
"git repos on local machine (when making own plugin)
"eg: Bundle "file:///Users/daleit/path/to/plugin'
"...
call vundle#end()
filetype plugin indent on	"required
" "Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"end Vundle requirements

"use folder for config files
runtime! config/**/*.vim

"set theme
set background=dark
colorscheme solarized
"enable 256 colors
"set t_Co=256

" get simplenote login creds
source ~/.simplenoterc

" vim statusline (AWEsome. Note this is installed systemwide via pip)
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

