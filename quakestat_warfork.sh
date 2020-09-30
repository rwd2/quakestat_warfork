#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_DIRECTORY=$(readlink -f $(dirname $SCRIPT))
TMPFILE=$(mktemp) || exit 1

main() {
    clear
    echo -e "\e[0;0mconnecting to server..."
    qstat -cfg "$SCRIPT_DIRECTORY/quakestat.cfg"  -P -R -ne -u -xml -utf8 -retry 1 -warforkm master1.forbidden.gg |  sed 's/\^[0-9]//g' > $TMPFILE
    clear
    xsltproc "$SCRIPT_DIRECTORY/quakestat.xsl" $TMPFILE  | xargs -0  echo -e
    rm $TMPFILE
    echo -e  "\e[0;35m"
    read -t 1 -n 1000 discard # discard keys typed during load
}
main
while read -n1 -r -p " -> press space to reload, or any other key to quit" && [[ "$REPLY" = ' ' ]]; 
do
 main
done
clear


