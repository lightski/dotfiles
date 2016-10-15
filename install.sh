#!/bin/bash
# installs dotfiles by symlinking
# !!!warning- clobbers existing files

# put basic dotfiles in place
declare -a files=("gitconfig" "jshintrc" "vimrc" "xinitrc" "xmobarrc" "xmonad/xmonad.hs" "Xresources" "zshrc")
for afile in "${files[@]}"; do
    ln -sf ~/.dotfiles/$afile ~/.$afile
done

# only symlink dirs if not linked already 
#  (else creates nested symlinks)
declare -a dirs=("bin" "vdirsyncer" "vim")
for dir in "${dirs[@]}"; do
    if [ ! -d ~/.$dir ]; then
        ln -sf "~/.dotfiles/$dir" "~/$dir"
    fi
done

# link custom environment bits to oh-my-zsh
for fle in $(ls custom-omz); do
	ln -sf ~/.dotfiles/custom-omz/$fle ~/.oh-my-zsh/custom/$fle
done

# if missing, install vundle for vim plugin management
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# download setup vim plugins in .vim/bundle/
vim +PluginInstall +qall

# final steps
echo "Complete vdirsyncer setup by editing vdirsyncer/example-get-creds.sh then save it to get-creds.sh"

