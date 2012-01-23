<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<!-- 

Global date formatting

-->
<xsl:template name="date-with-format">

    <div class="date">
        <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date" />
            <xsl:with-param name="format" select="'m x, Y'" />
        </xsl:call-template>
    </div>

</xsl:template>



<!-- 

How to start a URL when using multi-lingual

-->
<xsl:template name="root">

    <xsl:choose>
    	<xsl:when test="$url-language">
            <xsl:value-of select="concat($root, '/', $url-language, '/')" />
    	</xsl:when>
    	<xsl:otherwise>
    		<xsl:value-of select="concat($root, '/')" />
    	</xsl:otherwise>
    </xsl:choose>
    
</xsl:template>



<!-- 

Removes HTML tags

-->
<xsl:template name="remove-html">
    <xsl:param name="text"/>
    <xsl:choose>
        <xsl:when test="contains($text, '&lt;')">
            <xsl:value-of select="normalize-space(substring-before($text, '&lt;'))"/>
            <xsl:text> </xsl:text>
            <xsl:call-template name="remove-html">
                <xsl:with-param name="text" select="normalize-space(substring-after($text, '&gt;'))"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>



<!-- 

Strip out spaces in source

-->
<xsl:strip-space elements="*"/>

<xsl:template name="nbsp">
    
    <xsl:param name="text" />
    
    <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$text" />
        <xsl:with-param name="replace" select="' '" />
        <xsl:with-param name="by" select="'&#160;'" />
    </xsl:call-template>

</xsl:template>



<!-- 

Search and replace

-->
<xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:choose>
        <xsl:when test="contains($text,$replace)">
            <xsl:value-of select="substring-before($text,$replace)"/>
            <xsl:value-of select="$by"/>
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                <xsl:with-param name="replace" select="$replace"/>
                <xsl:with-param name="by" select="$by"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>



</xsl:stylesheet>