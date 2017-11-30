<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="typ.xsl"/>
    <xsl:template name="semestre1"> 
        
        <h3><xsl:value-of select="nome"/></h3>
        <div class="epocasDesc">Epoca Normal - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaNormal"/></div>
        <table border="1">
            <xsl:call-template name="table"/>
            <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                <xsl:if test="semestre = 1">
                    <xsl:for-each select="epocas/epoca[@nome='Normal']/exame">
                        <xsl:call-template name="for"/>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </table>
        <div class="epocasDesc">Epoca Recurso - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaRecurso"/></div>
        <table border="1">
            <xsl:call-template name="table"/>
            <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                <xsl:if test="semestre = 1">
                    <xsl:for-each select="epocas/epoca[@nome='Recurso']/exame">
                        <xsl:call-template name="for"/>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>