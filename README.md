# Description
Commandline shell script that displays server and playerinfo for the game Warfork. It is meant for Linux but should work on any system that supports 'sh' shell scripts.

Right now it is configured to show only human players. Servers with no human players, and 'tv' servers are filtered out. 

The script has zero options. So if you want to change the sorting and filtering you need to edit quakestat.xsl. 

Dependencies are qstat (or quakestat) and libxslt 

# To make it work:

1) Install qstat and libxslt. Chances are you altready have libxslt.

2) Add this to /etc/qstat.cfg:

<pre>
gametype WARFORKS new extend Q2S
    name = Warfork
    default port = 44400
    template var = WARFORK
    game rule = gamename
    status packet = \377\377\377\377getinfo
    status2 packet = \377\377\377\377getstatus
end

gametype WARFORKM new extend Q3M
    name = Warfork Master
    template var = WARFORKMASTER
    default port = 27950
    master packet = \377\377\377\377getservers Warfork %s %s
    master protocol = 22
    master query = empty full
    master for gametype = WARFORKS
end
</pre>

3) Save quakestat_warfork.sh and quakstat.xsl where you want to run it from.

4) Run quakestat_warfork.sh 
