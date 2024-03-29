#extra omz environment settings
# overwrite bin to use the dotfiles bin as well
export PATH=$HOME/.bin:/usr/local/bin:$HOME/android-studio/bin:/opt/clojurescript/bin/:$HOME/.meteor:~/.gem/ruby/2.4.0/bin:$PATH
# setup for android dev
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

# ocaml setup
. /home/daniel/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# setup lesspipe so we can less bin(s), eg pdf
LESSOPEN=|lesspipe.sh %s

