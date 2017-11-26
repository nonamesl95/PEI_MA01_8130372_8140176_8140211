declare namespace pei="http://namespace.com/Epocas";
<html>
<body>

<table border="1">
<tr>
<th>Codigo</th>
<th>Unidade Curricular</th>
<th>Regente</th>
</tr>
{

for $x in doc('ESTG_GERALNOVO.xml')/pei:mapa/pei:cursos
return <tr>

{
for $i in $x/pei:curso/pei:unidadesCurriculares/pei:unidadeCurricular
return <tr><td>{data($i/@cod)}</td><td>{data($i/pei:nome)}</td><td>{data($i/pei:responsavel)}</td></tr>
}
</tr>
}
</table>

</body>
</html>
