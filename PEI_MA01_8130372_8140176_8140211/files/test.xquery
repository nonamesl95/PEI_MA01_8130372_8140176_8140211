
declare function local:identityFunction() 
{
for $x in doc('./files/ESTG_Mapa.xml')/mapa/cursos/curso
for $y in $x/unidadesCurriculares/unidadeCurricular
for $t in $y/epocas/epoca

return if (count($t/exame)>2) then
<Erro> {data($y/nome)} do curso {data($x/nome)} tem mais que dois exames na mesma epoca</Erro>
 else if((count($t/exame)=2)) then

 for $k in $t/exame
 let $data:=$t/exame[1]/dia
 let $tipologia:=$t/exame[1]/@tipologia
 return if(($data != $k/dia)) then
 <erro>{data($y/nome)} do curso {data($x/nome)} tem dois exames que nao são realizados no mesmo dia</erro>
 
  else if(($data =$k/dia)and ($tipologia=$k/@tipologia))then
 <erro>{data($y/nome)} do curso {data($x/nome)} tem dois exames no mesmo dia de tipologias iguais</erro>
 else()
else ()
};

local:identityFunction()
