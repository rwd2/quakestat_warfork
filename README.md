# Description

quakestat_warfork is a commandline shell script that displays server and playerinfo for the game Warfork. It is meant for Linux but should work on any system that supports 'sh' shell scripts.

Servers with no human players, and 'tv' servers are filtered out. 

The script has zero options. So if you want to change the sorting and filtering you need to edit quakestat.xsl. 

# How to use:

1) Install qstat (or quakestat) and libxslt. Chances are you altready have libxslt.

2) keep quakestat_warfork.sh, quakstat.xsl and quakstat.cfg together in the same directory

3) Run quakestat_warfork.sh 

# Known issues

Because there is no reliable way to determine if a player is a bot or a human, this is now done by filtering out players with 0 ping. Human players with 0 ping are therefore filtered out as well unfortunately. 


