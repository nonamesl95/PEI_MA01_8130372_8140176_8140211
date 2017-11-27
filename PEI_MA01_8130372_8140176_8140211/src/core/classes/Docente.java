/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.classes;

import java.util.ArrayList;


/**
 *
 * @author 8130372/8140176/8140211
 */
public class Docente {
    private String codDocente;
    private ArrayList<Exame> exames;

    public Docente(String codDocente, ArrayList<Exame> exames) {
        this.codDocente = codDocente;
        this.exames = exames;
    }

    public String getCodDocente() {
        return codDocente;
    }

    public void setCodDocente(String codDocente) {
        this.codDocente = codDocente;
    }

    public ArrayList<Exame> getExames() {
        return exames;
    }

    public void setExames(ArrayList<Exame> exames) {
        this.exames = exames;
    }
    
    
}
