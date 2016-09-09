#!/bin/bash
# based on http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# note that -gt 0 processes one arg at a time
# use -gt 1 to process two for -key value pairs

# install: replace remote-user and remote-pass below 
#  for whatever service you're syncing with
out=""
while [[ $# -gt 0 ]]
do
	key="$1"
	
	case $key in
		-u|--user)
			out="remote-user"
			shift
			;;
		-p|--pass)
			out="remote-pass"
			shift
			;;
	esac
	shift
done
echo $out
