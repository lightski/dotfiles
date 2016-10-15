#!/bin/bash
# copies important laptop files to owncloud in case of HDD fail
#  NOTE removed projects dir due to size concern. Re-add later if you compress these first!
# @TODO -delete entries older than $timeframe (3 months/ 1 year?)
declare -a dirs=("~/Documents/iit/sem5" "~/Documents/wikis")
dest="~/ownCloud/backup"
date=`date "+%Y%m%d_%H%M%S"`

# rsync everything in dirs. symlink if same as most recent
#  for SOME reason -e returns false, but -L correctly sees file here. weird...
if [ -L "$dest/latest" ]; then # normal backup. has latest symlink
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

