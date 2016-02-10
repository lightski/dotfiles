#!/bin/bash
# installs dotfiles by symlinking

# put basic dotfiles in place
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc

# add custom environment bits to oh-my-zsh
for fle in $(ls custom_omz); do
	ln -s ~/.dotfiles/custom_omz/$fle ~/.oh-my-zsh/custom/$fle
done

