<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
    <xsl:template match="/"> 
        <html>
            <body>
                <h2>Mapa de Exames ESTG </h2>
                <h3>Epoca Normal - <xsl:value-of select="mapa/epocasAvaliacao/epocaNormal"/></h3>
                <xsl:for-each select="mapa/cursos/curso">
                
                    <h3>Curso: <xsl:value-of select="@codigo"/></h3>
                    
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
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/dia"/> - 
                               
                             </td>
                               <td><xsl:value-of select="anoCurricular"/></td>
                               <td><xsl:value-of select="nome"/></td>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/hora"/></td>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/sala"/></td>
                               <td><xsl:value-of select="epocas/epoca[@nome='Normal']/exame/responsavel"/></td>
                           </tr>
                        </xsl:for-each>
                    </table>
                    <h3>Epoca Recurso - <xsl:value-of select="../../epocasAvaliacao/epocaRecurso"/></h3>
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
                    <h3>Epoca Especial - - <xsl:value-of select="../../epocasAvaliacao/epocaEspecial"/></h3>
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
                                <td><xsl:value-of select="epocas/epoca[@nome='Especial']/exame/dia"/></td>
                                <td><xsl:value-of select="anoCurricular"/></td>
                                <td><xsl:value-of select="nome"/></td>
                                <td><xsl:value-of select="epocas/epoca[@nome='Especial']/exame/hora"/></td>
                                <td><xsl:value-of select="epocas/epoca[@nome='Especial']/exame/sala"/></td>
                                <td><xsl:value-of select="epocas/epoca[@nome='Especial']/exame/responsavel"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <hr></hr>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>