# quakestat_warfork
Little script that displays server and playerinfo for the game Warfork.

It currently has zero options. So if you want to change the sorting and filtering you need to edit quakestat.xsl. Right now it shows only servers that have at least one player with a non-zero ping. 'tv' servers are not shown. 

depends on qstat and libxslt 

# To make it work:

1) install qstat and libxslt .Chances are you altready have libxslt.

2) add this to /etc/qstat.cfg:

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

3) save quakestat_warfork.sh and quakstat.xsl where you want to run it from

4) edit quakestat_warfork.sh and change this part so it matches the absolute path of quakestat.xsl:

<pre>
    ~/<path...to>/quakestat.xsl 
</pre>

5) run quakestat_warfork.sh 
