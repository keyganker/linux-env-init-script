#!/bin/sh
if [ "$1" -gt 0 ] 2>/dev/null; then
    date -r$1 +"%Y-%m-%d %H:%M:%S"
else
	if [[ $1 =~ ' ' ]];then
        date -j -f "%Y-%m-%d %H:%M:%S" "$1"  +%s
	else
        date -j -f "%Y-%m-%d %H:%M:%S" "$1 00:00:00" +%s
	fi
fi
