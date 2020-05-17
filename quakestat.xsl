<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="text"/>

<xsl:template match="/qstat">
     <xsl:apply-templates select="server">
        <xsl:sort select="ping" data-type="number" order="ascending"/>
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="server">
<xsl:choose><xsl:when test="players/player/ping != '0' and not(rules/rule[@name='tv'] = '1')">
 \e[0;35m<xsl:choose><xsl:when test="rules/rule[@name='g_needpass'] = '1'">⨂ </xsl:when></xsl:choose><xsl:value-of select="name"/>\e[1;35m - ping <xsl:value-of select="ping"/> | gametype <xsl:choose><xsl:when test="rules/rule[@name='g_instagib'] = '1'">(instagib)</xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose><xsl:value-of select="rules/rule[@name='gametype']"/> | map <xsl:value-of select="map"/> | players <xsl:value-of select="numplayers"/>/<xsl:value-of select="maxplayers"/> | matchtime <xsl:value-of select="rules/rule[@name='g_match_time']"/>\e[0m<xsl:apply-templates select="players"/>
</xsl:when></xsl:choose>
</xsl:template>

<xsl:template match="players">
    <xsl:apply-templates select="player">
        <xsl:sort select="score" data-type="number" order="descending"/>
     </xsl:apply-templates>
</xsl:template>

<xsl:template match="player"><xsl:choose><xsl:when test="ping != '0'">
  \e[0;34m <xsl:choose><xsl:when test="score = '-9999'">-</xsl:when><xsl:otherwise><xsl:value-of select="score"/></xsl:otherwise></xsl:choose>\e[1;34m \e[;34m <xsl:value-of select="name"/>\e[1;34m ping:\e[0;34m <xsl:value-of select="ping"/>\e[1;34m team:\e[0;34m <xsl:value-of select="team"/>
</xsl:when></xsl:choose>
</xsl:template>

</xsl:stylesheet>
