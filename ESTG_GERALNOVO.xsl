<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >
    <xsl:import href="templateSemestre1NormalRecurso.xsl" />
    <xsl:import href="templateSemestre2NormalRecurso.xsl" />
    <xsl:import href="templateEpocaEspecial.xsl" />
    <xsl:template match="/"> 
        <html>
            <head>
                <link rel="stylesheet" href="mapaGeralStyles.css"/>
                <link href='https://fonts.googleapis.com/css?family=Aladin' rel='stylesheet'/>
            </head>
            <body>
                <header><div id="txt">Mapa de Exames</div><div id="image"><img src="images/logo-ipp.png"></img></div></header>
                <div class="semestre"> <h3>Semestre 1</h3></div>
                <xsl:for-each select="mapa/cursos/curso">
                    
                    <xsl:call-template name="semestre1"/>
                    
                </xsl:for-each>
                    <div class="semestre"><h3>Semestre 2</h3></div>
                    <xsl:for-each select="mapa/cursos/curso">
                        <xsl:call-template name="semestre2"/>
                </xsl:for-each>
                
                
                <hr></hr>
                
                <div class="semestre"><h3>Epoca Especial</h3></div>
                <xsl:for-each select="mapa/cursos/curso">
                    <xsl:call-template name="epocaEspecial"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
