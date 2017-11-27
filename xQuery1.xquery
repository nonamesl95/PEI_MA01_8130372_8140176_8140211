
<html>
<body>

<table border="1">
<tr>
<th>Codigo</th>
<th>Unidade Curricular</th>
<th>Regente</th>
</tr>
{

for $x in doc('ESTG_MAPA.xml')/mapa/cursos
return <tr>

{
for $i in $x/curso/unidadesCurriculares/unidadeCurricular
return <tr><td>{data($i/@cod)}</td><td>{data($i/nome)}</td><td>{data($i/responsavel)}</td></tr>
}
</tr>
}
</table>

</body>
</html>
