#!/bin/bash
# installs dotfiles by symlinking
# !!!warning- clobbers existing files

# put basic dotfiles in place
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/jshintrc ~/.jshintrc
ln -sf ~/.dotfiles/vdirsyncer ~/.vdirsyncer
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/xbindkeysrc.scm ~/.xbindkeysrc.scm
ln -sf ~/.dotfiles/xinitrc ~/.xinitrc
ln -sf ~/.dotfiles/xmobarrc ~/.xmobarrc
ln -sf ~/.dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
ln -sf ~/.dotfiles/Xresources ~/.Xresources
ln -sf ~/.dotfiles/zshrc ~/.zshrc

# only symlink dir if not linked already 
if [ ! -d ~/.vim ]; then
	ln -sf ~/.dotfiles/vim ~/.vim
fi

# link custom environment bits to oh-my-zsh
for fle in $(ls custom_omz); do
	ln -sf ~/.dotfiles/custom_omz/$fle ~/.oh-my-zsh/custom/$fle
done

# if missing, install vundle for vim plugin management
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# download setup vim plugins in .vim/bundle/
vim +PluginInstall +qall

# final steps
echo "Complete vdirsyncer setup by editing vdirsyncer/example-get-creds.sh then save it to get-creds.sh"

