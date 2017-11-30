<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="table">
        <tr >
            <th>Dia</th>
            <th>Ano</th>
            <th>Unidade Curricular</th>
            <th>Hora</th>
            <th>Sala</th>
            <th>Responsavel</th>
        </tr>
    </xsl:template>
    <xsl:template name="for">
        <tr>
            <td><xsl:value-of select="dia"/> - 
                
            </td>
            <td><xsl:value-of select="../../../anoCurricular"/></td>
            <td><xsl:value-of select="../../../nome"/></td>
            <td><xsl:value-of select="hora"/></td>
            <td><xsl:value-of select="sala"/></td>
            <td><xsl:value-of select="../../../responsavel/nome"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>