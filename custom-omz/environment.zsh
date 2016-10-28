# extra omz environment settings
# overwrite bin to use the dotfiles bin as well
export PATH=$HOME/.bin:/usr/local/bin:$HOME/android-studio/bin:/opt/clojurescript/bin/:$PATH
# setup for android dev on meteor
export ANDROID_HOME=$HOME/Android/Sdk
# 256 color mode go
if [ "$TERM" = "xterm" ]; then
	export TERM=xterm-256color
fi

# default editor=vim
export EDITOR="vim"
export VISUAL="vim"

# don't show user when logged in 
DEFAULT_USER="daniel"
