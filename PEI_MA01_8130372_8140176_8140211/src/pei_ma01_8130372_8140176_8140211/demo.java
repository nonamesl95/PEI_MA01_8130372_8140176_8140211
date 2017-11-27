/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pei_ma01_8130372_8140176_8140211;

import core.XmlApprover;

import java.text.ParseException;

import javax.xml.xpath.XPathExpressionException;

/**
 *
 * @author 8130372/8140176/8140211
 */
public class demo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws XPathExpressionException, ParseException {
        XmlApprover xa = new XmlApprover("./files/feriados.xml", "./files/ESTG_Mapa.xml", "./files/ESTG_Mapa.xsd");
        xa.read();
        if (xa.approveExamHolidays() == true) {
            System.out.println("Mapa Invalido");
        }

        if (xa.approveNumberExamsDayUC() == true) {
            System.out.println("Mapa Invalido");
        } else {

        }

        if (xa.approveTeacheronExam() == true) {
            System.out.println("Mapa Invalido");
        }
    }

}
