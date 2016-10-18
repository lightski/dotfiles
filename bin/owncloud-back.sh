#!/bin/bash
# copies important laptop files to owncloud in case of HDD fail
#  NOTE removed projects dir due to size concern. Re-add later if you compress these first!
# @TODO -delete entries older than $timeframe (3 months/ 1 year?)
#       -run full backup monthly then incremental otherwise (also fixes problem of deleting old)
#           ie, change 'latest' to most-recent-full backup
declare -a dirs=("/home/daniel/Documents/iit/sem5" "/home/daniel/Documents/wikis")
dest="/home/daniel/ownCloud/backup"
date=`date "+%Y%m%d_%H%M%S"`

# rsync everything in dirs. symlink if same as most recent
#  for SOME reason -e returns false, but -L correctly sees file here. weird...
if [ -L "$dest/latest" ]; then 
    # backup. only copy if file not in latest backup
	for fld in "${dirs[@]}"
	do
		rsync -az --link-dest="$dest/latest" "$fld" "$dest/$date"
	done
	rm "$dest/latest"
else # first time backup
	for fld in "${dirs[@]}"
	do
		rsync -az "$fld" "$dest/$date"
	done
fi

# recreate latest link
ln -s "$date" "$dest/latest"

