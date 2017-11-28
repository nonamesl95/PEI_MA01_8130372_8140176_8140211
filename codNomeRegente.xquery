declare function local:codNomeRegente()
{
for $x in doc('ESTG_Mapa.xml')/mapa/cursos
return <line>

{
for $i in $x/curso/unidadesCurriculares/unidadeCurricular
return <line><cod>{data($i/@cod)}</cod><nome>{data($i/nome)}</nome><responsavel>{data($i/responsavel/nome)}</responsavel></line>
} </line>
};

local:codNomeRegente()

