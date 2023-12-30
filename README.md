# Description

Quakestat_warfork is a bash shellscript that displays gameservers with players for the game Warfork.

Servers with no human players, and 'tv' servers are filtered out. 

The script has zero options. So if you want to change the sorting and filtering you need to edit quakestat.xsl. 

# How to use:

1) Install qstat (or quakestat) and libxslt

2) keep quakestat_warfork.sh, quakstat.xsl and quakstat.cfg together in the same directory

3) Run quakestat_warfork.sh 

# Known issues

Because there is no reliable way to determine if a player is a bot or a human, the filter is now based on whether or not a player has 0 ping. Human players with 0 ping are therefore filtered out as well unfortunately. 


