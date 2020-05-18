#!/bin/sh
# depends on qstat libxslt 
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
echo "connecting to server..."
qstat  -R -P -ne -u -xml -utf8 -retry 1 -warforkm master1.forbidden.gg |  sed 's/\^[0-9]//g' > /tmp/qstat_warfork.xml
clear
xsltproc ~/<path...to>/quakestat.xsl /tmp/qstat_warfork.xml  | xargs -0  echo -e
rm /tmp/qstat_warfork.xml
