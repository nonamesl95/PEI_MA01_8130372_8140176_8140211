/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.classes;

import java.util.Date;

/**
 *
 * @author 8130372/8140176/8140211
 */
public class Exame {

    private String unidadeCurricular;
    private Date dia;
    private Date hora;

    public Exame(String unidadeCurricular, Date dia, Date hora) {
        this.unidadeCurricular = unidadeCurricular;
        this.dia = dia;
        this.hora = hora;
    }

    public String getUnidadeCurricular() {
        return unidadeCurricular;
    }

    public void setUnidadeCurricular(String unidadeCurricular) {
        this.unidadeCurricular = unidadeCurricular;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

}
