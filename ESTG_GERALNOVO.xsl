<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pei="http://namespace.com/Epocas"
    xmlns:eval="http://namespace.com/EpocasAvaliacao"
    >
    
    <xsl:template match="/"> 
        <html>
            <head>
                <link rel="stylesheet" href="mapaGeralStyles.css"/>
                <link href='https://fonts.googleapis.com/css?family=Aladin' rel='stylesheet'/>
            </head>
            <body>
                <header>Mapa de Exames ESTG</header>
                
               
                <xsl:for-each select="pei:mapa/pei:cursos/pei:curso">
                
                    <h3><xsl:value-of select="pei:nome"/></h3>
                    <div class="epocasDesc">Epoca Normal - <xsl:value-of select="../../eval:epocasAvaliacao/eval:epocaNormal"/></div>
                    <table border="1">
                        <tr>
                            <th>Dia</th>
                            <th>Ano</th>
                            <th>Unidade Curricular</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Responsavel</th>
                        </tr>
                        <xsl:for-each select="pei:unidadesCurriculares/pei:unidadeCurricular">
                           <tr>
                               <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Normal']/pei:exame/pei:dia"/> - 
                               
                             </td>
                               <td><xsl:value-of select="pei:anoCurricular"/></td>
                               <td><xsl:value-of select="pei:nome"/></td>
                               <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Normal']/pei:exame/pei:hora"/></td>
                               <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Normal']/pei:exame/pei:sala"/></td>
                               <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Normal']/pei:exame/pei:responsavel"/></td>
                           </tr>
                        </xsl:for-each>
                    </table>
                    <div class="epocasDesc">Epoca Recurso - <xsl:value-of select="../../eval:epocasAvaliacao/eval:epocaRecurso"/></div>
                    <table border="1">
                        <tr >
                            <th>Dia</th>
                            <th>Ano</th>
                            <th>Unidade Curricular</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Responsavel</th>
                        </tr>
                        <xsl:for-each select="pei:unidadesCurriculares/pei:unidadeCurricular">
                            <tr>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Recurso']/pei:exame/pei:dia"/></td>
                                <td><xsl:value-of select="pei:anoCurricular"/></td>
                                <td><xsl:value-of select="pei:nome"/></td>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Recurso']/pei:exame/pei:hora"/></td>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Recurso']/pei:exame/pei:sala"/></td>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Recurso']/pei:exame/pei:responsavel"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <div class="epocasDesc">Epoca Especial - - <xsl:value-of select="../../eval:epocasAvaliacao/eval:epocaEspecial"/></div>
                    <table border="1">
                        <tr >
                            <th>Dia</th>
                            <th>Ano</th>
                            <th>Unidade Curricular</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Responsavel</th>
                        </tr>
                        <xsl:for-each select="pei:unidadesCurriculares/pei:unidadeCurricular">
                            <tr>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Especial']/pei:exame/pei:dia"/></td>
                                <td><xsl:value-of select="pei:anoCurricular"/></td>
                                <td><xsl:value-of select="pei:nome"/></td>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Especial']/pei:exame/pei:hora"/></td>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Especial']/pei:exame/pei:sala"/></td>
                                <td><xsl:value-of select="pei:epocas/pei:epoca[@nome='Especial']/pei:exame/pei:responsavel"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <hr></hr>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>