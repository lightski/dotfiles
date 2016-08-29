" vim configuration

" install all plugins with vundle
source ~/.vim/vundle.vim

" automatically detect file types (must turn on after vuVundle)
filetype plugin indent on

" editor defaults
set number		"line numbers
syntax enable	"syntax highlighting
set fileformat=unix	"sane text files
set encoding=utf-8
set tabstop=4		"sane editing
set shiftwidth=4
set softtabstop=4

" key re-binds
inoremap <c-space> <c-n> "autocompletion with ctrl+space
inoremap <Nul> <c-n>
" ctags binding to F12
map <f12> :!ctags -R .<cr>
" simplernote
cmap Sn Simplenote -
" save files as sudo even if not started as sudo
cmap w!! w !sudo tee > /dev/null %
" f4 toggles search highlighting and show current value
:nnoremap <f4> :set hlsearch! hlsearch?<CR>

" set theme
set background=dark
colorscheme solarized

" vim statusline (AWEsome. Note this is installed systemwide via pip)
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" use folder for config files
runtime nerdtree.vim

" get simplenote login creds
source ~/.simplenoterc
