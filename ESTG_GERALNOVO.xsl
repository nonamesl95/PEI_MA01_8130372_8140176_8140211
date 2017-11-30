<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >
    
    <xsl:template match="/"> 
       
        
        <html>
            <head>
                <link rel="stylesheet" href="mapaGeralStyles.css"/>
                <link href='https://fonts.googleapis.com/css?family=Aladin' rel='stylesheet'/>
            </head>
            <body>
                <header><div id="txt">Mapa de Exames</div><div id="image"><img src="images/logo-ipp.png"></img></div></header>
             <h3>Semestre 1</h3>
                <xsl:for-each select="mapa/cursos/curso">
                    
                    <h3><xsl:value-of select="nome"/></h3>
                    <div class="epocasDesc">Epoca Normal - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaNormal"/></div>
                    <table border="1">
                        <tr>
                            <th>Dia</th>
                            <th>Ano</th>
                            <th>Unidade Curricular</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Responsavel</th>
                        </tr>
                        
                        <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                            <xsl:if test="semestre = 1">
                            <xsl:for-each select="epocas/epoca[@nome='Normal']/exame">
                           <tr>
                               <td>
                                   <xsl:value-of select="dia"/>
                             </td>
                               <td><xsl:value-of select="../../../anoCurricular"/></td>
                               <td><xsl:value-of select="../../../nome"/></td>
                               <td><xsl:value-of select="hora"/></td>
                               <td><xsl:value-of select="sala"/></td>
                               <td><xsl:value-of select="../../../responsavel/nome"/></td>
                           </tr>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                    <div class="epocasDesc">Epoca Recurso - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaRecurso"/></div>
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
                            <xsl:if test="semestre = 1">
                            <xsl:for-each select="epocas/epoca[@nome='Recurso']/exame">
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
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                    <h3>Semestre 2</h3>
                    <xsl:for-each select="mapa/cursos/curso">
                        
                        <h3><xsl:value-of select="nome"/></h3>
                        <div class="epocasDesc">Epoca Normal - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='2']/epocaNormal"/></div>
                        <table border="1">
                            <tr>
                                <th>Dia</th>
                                <th>Ano</th>
                                <th>Unidade Curricular</th>
                                <th>Hora</th>
                                <th>Sala</th>
                                <th>Responsavel</th>
                            </tr>
                            
                            <xsl:for-each select="unidadesCurriculares/unidadeCurricular">
                                <xsl:if test="semestre = 2">
                                    <xsl:for-each select="epocas/epoca[@nome='Normal']/exame">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="dia"/>
                                            </td>
                                            <td><xsl:value-of select="../../../anoCurricular"/></td>
                                            <td><xsl:value-of select="../../../nome"/></td>
                                            <td><xsl:value-of select="hora"/></td>
                                            <td><xsl:value-of select="sala"/></td>
                                            <td><xsl:value-of select="../../../responsavel/nome"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                        <div class="epocasDesc">Epoca Recurso - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaRecurso"/></div>
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
                                <xsl:if test="semestre = 2">
                                    <xsl:for-each select="epocas/epoca[@nome='Recurso']/exame">
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
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    
                    
                    
               
                    <hr></hr>
                </xsl:for-each>
                <hr></hr>
                <h3>Epoca Especial</h3>
                <div class="epocasDesc">Epoca Especial - - <xsl:value-of select="../../epocasAvaliacao/epocas[@semestre='1']/epocaEspecial"/></div>
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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
