/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.feriados;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 8130372/8140176/8140211
 */
@XmlRootElement(name = "feriados")
public class Feriados {

    ArrayList<Feriado> feriados;

    public Feriados() {
    }

    
    public Feriados(ArrayList<Feriado> feriados) {
        this.feriados = feriados;
    }
@XmlElement
    public ArrayList<Feriado> getFeriados() {
        return feriados;
    }

    public void setFeriados(ArrayList<Feriado> feriados) {
        this.feriados = feriados;
    }

}
