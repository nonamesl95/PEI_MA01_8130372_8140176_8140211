<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/"> 
        <html>
            <body>
                <h2>Mapa de Exames ESTG </h2>
                <xsl:for-each select="mapa/cursos/curso">
                    <h3>Curso: <xsl:value-of select="@codigo"/></h3>
                    <h3>Epoca Normal</h3>
                    <table border="1">
                        <tr bgcolor="#9acd32">
                            <th>Dia</th>
                            <th>Ano</th>
                            <th>Unidade Curricular</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Responsavel</th>
                        </tr>
                        <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                           <tr>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/dia"/></td>
                               <td><xsl:value-of select="anoCurricular"/></td>
                               <td><xsl:value-of select="nome"/></td>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/hora"/></td>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/sala"/></td>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/responsavel"/></td>
                           </tr>
                        </xsl:for-each>
                    </table>
                    <h3>Epoca Recurso</h3>
                    <table border="1">
                        <tr bgcolor="#9acd32">
                            <th>Dia</th>
                            <th>Ano</th>
                            <th>Unidade Curricular</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Responsavel</th>
                        </tr>
                        <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                            <tr>
                                <td><xsl:value-of select="epocas/epoca[@nome='Recurso']/exame/dia"/></td>
                                <td><xsl:value-of select="anoCurricular"/></td>
                                <td><xsl:value-of select="nome"/></td>
                                <td><xsl:value-of select="epocas/epoca[@nome='Recurso']/exame/hora"/></td>
                                <td><xsl:value-of select="epocas/epoca[@nome='Recurso']/exame/sala"/></td>
                                <td><xsl:value-of select="epocas/epoca[@nome='Recurso']/exame/responsavel"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <h3>Epoca Especial</h3>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>