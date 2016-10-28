#!/bin/bash
# copies important laptop files to owncloud in case of HDD fail
#  NOTE removed projects dir due to size concern. Re-add later if you compress these first!
# @TODO -delete entries older than $timeframe (3 months/ 1 year?)
declare -a dirs=("/home/daniel/Documents/iit/sem5" "/home/daniel/Documents/wikis")
dest="/home/daniel/ownCloud/backup"
date=`date "+%Y%m%d_%H%M%S"`
# rsync everything in dirs. symlink if same as most recent
#  for SOME reason -e returns false, but -L correctly sees file here. weird...
if [ -L "$dest/full-monthly" ]; then 
    thismonth=${date:4:2}
    monthsym=`ls -l $dest | grep full-monthly`
    lastmonth=${monthsym:65:2}
    if [ $(($thismonth-$lastmonth)) -eq 0 ]; then
        # backup diff, ie copy if unchanged from monthly backup.
        for fld in "${dirs[@]}"
        do
            rsync -az --link-dest="$dest/full-monthly"\
                "$fld" "$dest/$date"
        done
    else # new monthly backup
        for fld in "${dirs[@]}"
        do
            rsync -az "$fld" "$dest/$date"
        done
        rm "$dest/full-monthly"
        ln -s "$date" "$dest/full-monthly"
    fi
else # first time backup
	for fld in "${dirs[@]}"
	do
		rsync -az "$fld" "$dest/$date"
	done
    ln -s "$date" "$dest/full-monthly" # create full-monthly link
fi


