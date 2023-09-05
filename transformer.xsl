<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:template match="resumee">
    <html>
        <head>
            <link href="style.css" rel="stylesheet" type="text/css"/>
        </head>
        <body>
            <div id="resume">
            <xsl:apply-templates select="general"/>
            <xsl:apply-templates select="skills"/>
            <xsl:apply-templates select="history"/>
            <xsl:apply-templates select="languages"/>
            <xsl:apply-templates select="hobbies"/>
            </div>
        </body>
    </html>
</xsl:template>
<!-- Removes empty nodes: -->
<xsl:template match=
  "*[not(node())]
  |
   *[not(node()[2])
   and
     node()/self::text()
   and
     not(normalize-space())
     ]
  "/>
<xsl:template match="general">
    <img alt="face">
        <xsl:attribute name="src"><xsl:value-of select="photo"/></xsl:attribute>
    </img>
    <h1><xsl:value-of select="firstName"/>&#160; <xsl:value-of select="lastName"/></h1>
    <xsl:apply-templates select="site|email|phone"/>
    <p id="objective"><xsl:value-of select="description"/></p>
</xsl:template>
<xsl:template match="site|email|phone">
    <p>
    <xsl:sequence select="concat(upper-case(substring(local-name(),1,1)),substring(local-name(), 2))"/>:
    <a href="#">
        <xsl:if test="local-name()='site'">
            <xsl:attribute name="href"><xsl:text>http://</xsl:text><xsl:value-of select="."/></xsl:attribute>
        </xsl:if>
        <xsl:value-of select="."/>
    </a></p>
</xsl:template>
<xsl:template match="history">
    <xsl:apply-templates/>
</xsl:template>
<xsl:template match="education">
    <dl>
        <dt>Education</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="skills">
    <dl>
        <dt>Compétences</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="jobs">
    <dl>
        <dt>Emplois</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="internships">
    <dl>
        <dt>Stages</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="associations">
    <dl>
        <dt>Associations</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="research">
    <dl>
        <dt>Recherche</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="experience">
    <dl>
        <dt>Expérience</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="languages">
    <dl>
        <dt>Langues</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="hobbies">
    <dl>
        <dt>Centres d'intérêts</dt>
        <dd>
         <xsl:apply-templates/>
        </dd>
    </dl>
</xsl:template>
<xsl:template match="entry">
        <h2><xsl:value-of select="title"/>
            <span><xsl:value-of select="place"/><xsl:text> - </xsl:text>
            <xsl:value-of select="dateStart"/><xsl:text> - </xsl:text><xsl:value-of select="dateStart"/>
            </span></h2>
        <p><xsl:value-of select="subtitle"/></p>
        <p><xsl:value-of select="description"/></p>
</xsl:template>
 </xsl:stylesheet>