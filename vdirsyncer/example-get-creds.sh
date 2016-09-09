#!/bin/bash
# based on http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# note that -gt 0 processes one arg at a time
# use -gt 1 to process two for -key value pairs

# install: replace url, user, pass, etc. below 
#  with details of service you're syncing with
#  remember to save as get-creds.sh and make it executable!
out=""
while [[ $# -gt 0 ]]
do
	key="$1"
	
	case $key in
		-c|--contacts)
			out="https://example.com/contact/sync/addr/"
			shift
			;;
		-d|--calendar)
			out="https://example.com/calendar/sync/addr/"
			shift
			;;
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
