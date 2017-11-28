declare function local:calcWeekExams($semana, $semestre, $curso, $anoCurricular){
    let $semana:=0
       let $dataInicioNormal:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaNormal/dataInicio
   let $dataFimNormal:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaNormal/dataInicio
     let $dataInicioEspecial:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaEspecial/dataInicio
   let $dataFimEspecial:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaEspecial/dataInicio
     let $dataInicioRecurso:= doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaRecurso/dataInicio
   let $dataFimRecurso:=doc('ESTG_MAPA.xml')/mapa/epocasAvaliacao/epocaRecurso/dataInicio
   
   
    for $x in doc('ESTG_MAPA.xml')/mapa/cursos
    let $cur:=$x/curso[codigo=$curso]

    return count ($cur/unidadesCurriculares/unidadeCurricular[semestre = $semestre and anoCurricular = $anoCurricular])
};

local:calcWeekExams("1", "1", "LEI", "1")
