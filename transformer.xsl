<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text/html" encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:template match="resumee">
    <html>
        <head></head>
        <body>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>
<xsl:template match="education">
    <ul><xsl:apply-templates/></ul>
</xsl:template>
<xsl:template match="entry">
    <li><xsl:apply-templates/></li>
</xsl:template>
 </xsl:stylesheet>