#!/bin/bash
#
# Open vim to the Vimwiki Index based on time of day.
# Based on journal.sh
# -----------------------------------------------------------
export DISPLAY=:0
if [ $(date +%H) -lt 17 ]; then
    # prior to 17:00; tech thoughts
    index=1
else
    # off the clock; anything goes
    index=2
fi
# prompt for new journal entry
/usr/bin/gvim -c "+normal $index\\ww"

