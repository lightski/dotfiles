#!/bin/bash
# installs dotfiles by symlinking
# !!!warning- clobbers existing files

installdir=$(echo ~/.dotfiles)

# put basic dotfiles in place
for afile in $(ls $installdir/settings); do
    ln -sf $installdir/settings/$afile ~/.$afile
done

# set up xmonad dir and config
if [ ! -d ~/.xmonad ]; then
    mkdir ~/.xmonad
fi
ln -sf $installdir/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

# only symlink dirs if not linked already 
#  (else creates nested symlinks)
declare -a dirs=("bin" "vdirsyncer" "vim")
for dir in "${dirs[@]}"; do
    if [ ! -d ~/.$dir ]; then
        ln -sf $installdir/$dir ~/$dir
    fi
done

# link custom environment bits to oh-my-zsh
for fle in $(ls $installdir/custom-omz); do
	ln -sf $installdir/custom-omz/$fle ~/.oh-my-zsh/custom/$fle
done

# if missing, install vundle for vim plugin management
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# download setup vim plugins in .vim/bundle/
vim +PluginInstall +qall

# final steps
echo "Complete vdirsyncer setup by editing vdirsyncer/example-get-creds.sh then save it to get-creds.sh"

