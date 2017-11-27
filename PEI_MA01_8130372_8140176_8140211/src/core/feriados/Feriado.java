/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.feriados;

import java.util.Date;

/**
 *
 * @author 8130372/8140176/8140211
 */
public class Feriado {
    private Date data;
    private String nome;

    public Feriado(Date data, String nome) {
        this.data = data;
        this.nome = nome;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
