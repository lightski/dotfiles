#!/bin/bash
#
# Timed script for 30-min activity journal via vimwiki
# based on http://www.stochasticgeometry.ie/2012/11/23/vimwiki/
# 
# Known limitation: needs 1+ lines of whitespace at top of journal
#   else it will place insertion in middle of last entry
#   this is due to behavior of vim's r option
# POSSIBLE flaw: sets g:vimwiki_current_idx directory directly
#   see ./vimiki-index.sh for another approach
# -----------------------------------------------------------
export DISPLAY=:0
if [ $(date +%H) -lt 17 ]; then
    # prior to 17:00; tech thoughts
    index=0
    prompt="in tech"
else
    # off the clock; anything goes
    index=1
    prompt="irl"
fi
# prompt for new journal entry
/usr/bin/gvim\
    -c "let g:vimwiki_current_idx=$index"\
    -c "VimwikiMakeDiaryNote"\
    -c "r !date +'\%n= \%H:\%M =\%nWhats new $prompt?'"
# generate links for entry just added
/usr/bin/vim\
    -c "let g:vimwiki_current_idx=$index"\
    -c "VimwikiDiaryIndex"\
    -c "VimwikiDiaryGenerateLinks"\
    -c "x"

