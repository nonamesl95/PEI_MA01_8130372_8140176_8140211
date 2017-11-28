declare function local:calcWeek($semana){
  let $s:="normal"
       let $dataInicioNormal:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaNormal/dataInicio
   let $dataFimNormal:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaNormal/dataInicio
     let $dataInicioEspecial:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaEspecial/dataInicio
   let $dataFimEspecial:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaEspecial/dataInicio
     let $dataInicioRecurso:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaRecurso/dataInicio
   let $dataFimRecurso:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaRecurso/dataInicio
   
return if ((xs:dateTime($semana)>= xs:dateTime($dataInicioNormal))or (xs:dateTime($semana)<= xs:dateTime($dataFimNormal))) then
let $s:="normal"
else()
return if((xs:dateTime($semana)>= xs:dateTime($dataInicioRecurso))or (xs:dateTime($semana)<= xs:dateTime($dataFimRecurso))) then
 <Erro></Erro>
else if((xs:dateTime($semana)>= xs:dateTime($dataInicioRecurso))or (xs:dateTime($semana)<= xs:dateTime($dataFimRecurso)))then
<Erro></Erro>
else <Erro></Erro>

   
 
};



declare function local:calcWeekExams($semana, $semestre, $curso, $anoCurricular){
  for $x in doc('ESTG_MAPA.xml')/mapa/cursos
    let $cur:=$x/curso[codigo=$curso]
let $sem:= local:calcWeek($semana)
    return count ($cur/unidadesCurriculares/unidadeCurricular[semestre = $semestre and anoCurricular = $anoCurricular])
}


 local:calcWeekExams("2018-01-15", "1", "LEI", "1")