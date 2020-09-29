#!/bin/sh
# dependencies: qstat (alias quakestat) , libxslt 
#
# put in /etc/qstat.cfg:
#
#gametype WARFORKS new extend Q2S
#    name = Warfork
#    default port = 44400
#    template var = WARFORK
#    game rule = gamename
#    status packet = \377\377\377\377getinfo
#    status2 packet = \377\377\377\377getstatus
#end
#
#gametype WARFORKM new extend Q3M
#    name = Warfork Master
#    template var = WARFORKMASTER
#    default port = 27950
#    master packet = \377\377\377\377getservers Warfork %s %s
#    master protocol = 22
#    master query = empty full
#    master for gametype = WARFORKS
#end

SCRIPT=$(readlink -f "$0")
SCRIPT_DIRECTORY=$(readlink -f $(dirname $SCRIPT))
TMPFILE=$(mktemp) || exit 1

main() {
    clear
    echo -e "\e[0;0mconnecting to server..."
    qstat  -P -R -ne -u -xml -utf8 -retry 1 -warforkm master1.forbidden.gg |  sed 's/\^[0-9]//g' > $TMPFILE
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


