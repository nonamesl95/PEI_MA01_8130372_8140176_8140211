declare function local:unidadesCurricularesDocente($cod){
    
    let $count:=0

return <UnidadesdoDocente>{count(doc('ESTG_MAPA.xml')/mapa/cursos/curso/unidadesCurriculares/unidadeCurricular/responsavel[cod=$cod])}</UnidadesdoDocente>

};

local:unidadesCurricularesDocente("001")