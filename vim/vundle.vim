" vundle settings 
set nocompatible	"be iMproved
filetype off		"required! for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" my plugins here
"
" plugins on github repo
" css3 syntax
Plugin 'hail2u/vim-css3-syntax' 
" adds stuff around stuff
Plugin 'tpope/vim-surround'
" quick 'n ez html
Plugin 'rstacruz/sparkup'
" syntastic syntax highlighter
Plugin 'scrooloose/syntastic'
" debugger
Plugin 'joonty/vdebug.git'
" auto-close brackets, parens, etc.
Plugin 'Raimondi/delimitMate.git'
" file browsing
Plugin 'scrooloose/nerdtree'
" color scheme
Plugin 'altercation/vim-colors-solarized'
" vimwiki is best wiki
Plugin 'vimwiki/vimwiki'
" clojure tools
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
" yaml support
Plugin 'stephpy/vim-yaml'
" simplenote plugin
Plugin 'mrtazz/simplenote.vim' 
" fix paste from outside
Plugin 'ConradIrwin/vim-bracketed-paste'
" js indentation + syntax
Plugin 'pangloss/vim-javascript'

" vim-scripts repos
"Plugin 'L9'
" non github repos
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on local machine (when making own plugin)
"Plugin "file:///Users/daniel/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All plugins must be added before this!
call vundle#end()

"
"Brief help
" :PluginList       - list configured bundles
" :PluginInstall    - install bundles; to update append ! or just :PluginUpdate
" :PluginSearch foo - searchs for foo; append ! to refresh local cache
" :PluginClean      - confirms removal of unused bundles; append ! to auto-approve
"
" see :h vundle for more details or wiki for FAQ
" end Vundle requirements

