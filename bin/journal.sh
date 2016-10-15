#!/bin/bash
#
# Timed script for 30-min activity journal via vimwiki
# based on http://www.stochasticgeometry.ie/2012/11/23/vimwiki/
# 
# Known limitation: needs 1+ lines of whitespace at top of journal
#   else it will place insertion in middle of last entry
#   this is due to behavior of vim's r option...
# -----------------------------------------------------------
declare -a diaries=("tech" "feels-n-reals")
path="~/Documents/wikis/"
export DISPLAY=:0
if [ $(date +%H) -lt 17 ]; then
    /usr/bin/gvim -geometry 100x40+512+400\
        -c "let g:vimwiki_current_idx=0"\
        -c "VimwikiMakeDiaryNote"\
        -c "r !date +'\%n= \%H:\%M =\%nLab notebook. Whats new in tech?'"
    /usr/bin/vim -e -s -c "VimwikiDiaryGenerateLinks"\
        -c "x" ~/Documents/wikis/tech/diary/diary.wiki 
else
    /usr/bin/gvim -geometry 100x40+512+400\
        -c "let g:vimwiki_current_idx=1"\
        -c "VimwikiMakeDiaryNote"\
        -c "r !date +'\%n= \%H:\%M =\%nWhats new irl?'"
    /usr/bin/vim -e -s -c "VimwikiDiaryGenerateLinks"\
        -c "x" ~/Documents/wikis/feels-n-reals/diary/diary.wiki
fi
