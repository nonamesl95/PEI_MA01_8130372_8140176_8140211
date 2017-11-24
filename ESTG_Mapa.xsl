<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/"> 
    <html>
        <body>
            <h2>Mapa de Exames ESTG </h2>
            <xsl:for-each select="mapaGeral/mapa">
                <h3>Curso: <xsl:value-of select="@codigo"/></h3>
                <xsl:for-each select="epocasAvaliacao/epoca">
                    <h3>Epoca: <xsl:value-of select="@tipo"/></h3>
                    <xsl:for-each select="exames/exame">
                        <h3>Unidade Curricular: <xsl:value-of select="uCurricular/nome"/></h3>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
         
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>