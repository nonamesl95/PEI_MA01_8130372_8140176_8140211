<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/" name="epocaEspecial">
        <h3><xsl:value-of select="nome"/></h3>
        <div class="epocasDesc">Epoca Especial - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaEspecial"/></div>
        <table border="1">
            <tr >
                <th>Dia</th>
                <th>Ano</th>
                <th>Unidade Curricular</th>
                <th>Hora</th>
                <th>Sala</th>
                <th>Responsavel</th>
            </tr>
            <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                <xsl:for-each select="epocas/epoca[@nome='Especial']/exame">
                    <tr>
                        <td><xsl:value-of select="dia"/> - 
                            
                        </td>
                        <td><xsl:value-of select="../../../anoCurricular"/></td>
                        <td><xsl:value-of select="../../../nome"/></td>
                        <td><xsl:value-of select="hora"/></td>
                        <td><xsl:value-of select="sala"/></td>
                        <td><xsl:value-of select="../../../responsavel/nome"/></td>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>