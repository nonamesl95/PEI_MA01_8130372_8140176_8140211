<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="typ.xsl"/>
    <xsl:template match="/" name="epocaEspecial">
        
        <h3><xsl:value-of select="nome"/></h3>
        <div class="epocasDesc">Epoca Especial - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaEspecial"/></div>
        <table border="1">
         <xsl:call-template name="table"/>
            <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                <xsl:for-each select="epocas/epoca[@nome='Especial']/exame">
                    <xsl:call-template name="for"/>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>