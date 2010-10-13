<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="_">
		<xsl:param name="key" />
		<xsl:variable name="str" select="$strings//str[@name = $key]" />
		<xsl:choose>
			<xsl:when test="$str[lang($LANGUAGE)]">
				<xsl:for-each select="$str[lang($LANGUAGE)][1]/node()">
					<xsl:copy-of select="." />
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$key" />
				<xsl:message>Unlocalized string: <xsl:value-of select="$key" />, language: <xsl:value-of select="$LANGUAGE" /></xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="html-link">
		<xsl:param name="href" select="''" />
		<xsl:param name="name" />
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:if test="substring($href, 1, 1) = '/'">
					<xsl:value-of select="$BASE"/>
				</xsl:if>
				<xsl:value-of select="$href"/>
			</xsl:attribute>
			<xsl:value-of select="$name" />
		</xsl:element>
	</xsl:template>
	
	<xsl:template name="html-head">
		<xsl:param name="title" select="''" />
		<xsl:if test="$title">
			<title><xsl:value-of select="$title" /></title>
		</xsl:if>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</xsl:template>

	<xsl:template name="indent">
		<xsl:param name="amount" />
		<xsl:for-each select="//node()[position() &lt; $amount]">
			<xsl:text>  </xsl:text>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="xml">
		<xsl:param name="depth" select="2" />
		
		<xsl:call-template name="indent"><xsl:with-param name="amount" select="$depth" /></xsl:call-template>
		<xsl:text>&lt;</xsl:text>
		<xsl:value-of select="name()" />
		<xsl:text> </xsl:text>
		<xsl:for-each select="@*">
			<xsl:value-of select="name()" />
			<xsl:text>="</xsl:text>
			<xsl:value-of select="." />
			<xsl:text>" </xsl:text>
		</xsl:for-each>
		<xsl:text>&gt;
</xsl:text>

		<xsl:for-each select="*">
			<xsl:call-template name="xml">
				<xsl:with-param name="depth" select="$depth + 1" />
			</xsl:call-template>
		</xsl:for-each>
		
		<xsl:if test=". != ''">
			<xsl:call-template name="indent"><xsl:with-param name="amount" select="$depth + 1" /></xsl:call-template>
			<xsl:value-of select="." />
			<xsl:text>
</xsl:text>
		</xsl:if>
		
		<xsl:call-template name="indent"><xsl:with-param name="amount" select="$depth" /></xsl:call-template>
		<xsl:text>&lt;/</xsl:text>
		<xsl:value-of select="name()" />
		<xsl:text>&gt;
</xsl:text>
	</xsl:template>

</xsl:stylesheet>
