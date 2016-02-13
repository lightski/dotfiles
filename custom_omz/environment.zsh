# extra omz environment settings
# overwrite bin to use the dotfiles bin as well
export PATH=$HOME/.dotfiles/bin:/usr/local/bin:$HOME/android-studio/bin:$PATH
# setup for android dev on meteor
export ANDROID_HOME=$HOME/Android/Sdk
# 256 color mode go
if [ "$TERM" = "xterm" ]; then
	export TERM=xterm-256color
fi

# default editor=vim
export EDITOR="vim"
export VISUAL="vim"

