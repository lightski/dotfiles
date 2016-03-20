#!/bin/bash
# installs dotfiles by symlinking
# !!!warning- clobbers existing files

# put basic dotfiles in place
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/xbindkeysrc.scm ~/.xbindkeysrc.scm
ln -sf ~/.dotfiles/xinitrc ~/.xinitrc
ln -sf ~/.dotfiles/xmobarrc ~/.xmobarrc
ln -sf ~/.dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
ln -sf ~/.dotfiles/Xresources ~/.Xresources

# add custom environment bits to oh-my-zsh
for fle in $(ls custom_omz); do
	ln -sf ~/.dotfiles/custom_omz/$fle ~/.oh-my-zsh/custom/$fle
done

