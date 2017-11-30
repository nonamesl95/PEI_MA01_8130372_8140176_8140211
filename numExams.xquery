declare function local:calcWeek($semana, $semestre){
  
   let $dataInicioNormal:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocas[@semestre = $semestre]/epocaNormal/dataInicio
   let $dataFimNormal:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocas[@semestre = $semestre]/epocaNormal/dataInicio
   let $dataInicioEspecial:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocas[@semestre = $semestre]/epocaEspecial/dataInicio
   let $dataFimEspecial:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocas[@semestre = $semestre]/epocaEspecial/dataInicio
   let $dataInicioRecurso:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocas[@semestre = $semestre]/epocaRecurso/dataInicio
   let $dataFimRecurso:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocas[@semestre = $semestre]/epocaRecurso/dataInicio
   
return if ((xs:date($semana)>= xs:date($dataInicioNormal))or (xs:date($semana)<= xs:date($dataFimNormal))) then
let $s:="Normal"
return ($s)
else if ((xs:date($semana)>= xs:date($dataInicioRecurso))or (xs:date($semana)<= xs:date($dataFimRecurso)))then
let $s:="Recurso"
return ($s)
else if((xs:date($semana)>= xs:date($dataInicioEspecial))or (xs:date($semana)<= xs:date($dataFimEspecial)))then  
 let $s:="Especial"
 return ($s)
 else
 ("")
};



declare function local:calcWeekExams($semana, $semestre, $curso, $anoCurricular){
let $x:=local:calcWeek($semana, $semestre)

    return <NumeroExames>{count (doc('ESTG_MAPA.xml')/mapa/cursos/curso[codigo=$curso]/unidadesCurriculares/unidadeCurricular[semestre = $semestre and anoCurricular = $anoCurricular]/epocas/epoca[@nome=$x]/exame)}</NumeroExames>
};


 local:calcWeekExams("2018-01-15", "1", "LEI", "1")