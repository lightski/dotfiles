# add extra aliases to zsh
# quicker zsh config and aptitude
alias reload!=". ~/.zshrc"
alias update="sudo aptitude update && sudo aptitude upgrade"
alias sai="sudo aptitude install"
alias sar="sudo aptitude remove"

# apache2 admin 
alias ael="sudo tail -f /var/log/apache2/error.log"
alias ssar="sudo service apache2 restart"

# rsync copies all, displays progress, and resumes transfers by default
alias rsync="rsync -avzP"

# change directory and list
cdl()	{
	cd $@;
	ls -l;
}

# quick'n'dirty random password
randpw() {
	dd if=/dev/urandom bs=1 count=15 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev
}

# enable ls color support and add handy aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# timer script from http://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
# 20151007 -- input is now in minutes. saves typing. 
function countdown(){
	date1=$((`date +%s` + ($1 * 60) ));
	while [ "$date1" -ne `date +%s` ]; do
		echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
	done
	echo "\n"
	for i in `seq 1 4`; do
		echo -e "ding!\a"
		sleep .5
	done
}
# less to type
alias codo='countdown'

# 20151008 -- keep forgetting this one
alias simplenote-py='nvpy'
alias snpy='nvpy'

# 20160108 -- prompt on delete of -r or >3 files. just in case
alias rm='rm -I'

# 20160212 simpler vagrant
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant ssh'

