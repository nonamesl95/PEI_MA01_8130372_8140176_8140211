declare function local:unidadesCurricularesDocente($cod){
    
    let $count:=0

return count(doc('ESTG_MAPA.xml')/mapa/cursos/curso/unidadesCurriculares/unidadeCurricular/responsavel[cod=$cod])

};

local:unidadesCurricularesDocente("007")