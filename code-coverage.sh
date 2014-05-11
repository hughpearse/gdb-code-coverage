#!/bin/bash
#
# Usage: 
#          ./code-coverage.sh ./progname
#
# Output: 
#          1234
#          This is the number of unique lines of code executed.

rm ./gdb.txt

gdb -ex "set logging on" -ex "start" $@ -x ./commands.txt -q --batch > /dev/null

cat ./gdb.txt | egrep "^=> 0x" | cut -d ":" -f1 | sed "s/=>//g; s/\+.*.>//g; s/<//g; s/^ //g" | sort | uniq | wc -l
