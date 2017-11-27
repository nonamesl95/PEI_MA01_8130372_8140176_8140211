
declare function local:ole(){

for $x in doc('ESTG_MAPA.xml')/mapa/cursos
return <tr>

{
for $i in $x/curso/unidadesCurriculares/unidadeCurricular
return <tr><td>{data($i/@cod)}</td><td>{data($i/nome)}</td><td>{data($i/responsavel)}</td></tr>
}
</tr>
};

local:ole()
