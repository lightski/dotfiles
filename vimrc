" vim configuration

" vundle {{{
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

" automatically detect file types (must turn on after vuVundle)
filetype plugin indent on
" }}}

" plugin settings {{{
" open nerdtree with \d
nmap <leader>d :NERDTreeToggle<CR>

" get simplenote login creds
source ~/.simplenoterc

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" set vimwiki locations
let g:vimwiki_list = [{'path': '$HOME/Documents/wikis/tech'}, 
					\ {'path': '$HOME/Documents/wikis/feels-n-reals'}]
" }}}

" editor defaults {{{
set number		"line numbers
syntax enable	"syntax highlighting
set fileformat=unix	"sane text files
set encoding=utf-8
set tabstop=4		"sane editing
set shiftwidth=4
set softtabstop=4
set expandtab "tabs are spaces
set wildmenu	"better tab completion
" }}}

" key re-binds {{{
inoremap <c-space> <c-n> "autocompletion with ctrl+space
inoremap <Nul> <c-n>
" ctags binding to F12
map <f12> :!ctags -R .<cr>
" simplernote
cmap snl SimplenoteList
cmap snu SimplenoteUpdate
cmap snn SimplenoteNew
" save files as sudo even if not started as sudo
cmap w!! w !sudo tee > /dev/null %
" f4 toggles search highlighting and show current value
:nnoremap <f4> :set hlsearch! hlsearch?<CR>
" }}}

" set theme {{{
set background=dark
colorscheme solarized
" }}}

" vim statusline {{{
" installed systemwide via pacman
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" }}}

" ocaml indentation helper {{{
set rtp^="/home/daniel/.opam/system/share/ocp-indent/vim"
" }}}


