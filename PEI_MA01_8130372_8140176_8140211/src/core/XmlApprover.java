/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core;

import com.saxonica.xqj.SaxonXQDataSource;
import core.classes.Docente;
import core.classes.Exame;
import core.feriados.Feriado;
import core.feriados.Feriados;
import interfaces.XmlApproverADT;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import javax.xml.xquery.XQConnection;
import javax.xml.xquery.XQDataSource;
import javax.xml.xquery.XQException;

import javax.xml.xquery.XQPreparedExpression;
import javax.xml.xquery.XQResultSequence;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;

/**
 *
 * @author 8130372/8140176/8140211
 */
public class XmlApprover implements XmlApproverADT {

    private String feriadosXML;
    private String MapaXML;
    private String MapaXSD;

    private Document document;
    private Document xml;

    public XmlApprover(String feriadosXML, String MapaXML, String MapaXSD) {
        this.feriadosXML = feriadosXML;
        this.MapaXML = MapaXML;
        this.MapaXSD = MapaXSD;
    }

    public boolean validaXML() {
        boolean flag = false;
        String xml = MapaXML, xsd = MapaXSD;
        GestorXML gestor = new GestorXML(xml, xsd);
        if (gestor.validate(true)) {
            flag = true;

        } else {
            flag = false;
        }
        return flag;
    }

    public void read() {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db;
        try {
            db = dbf.newDocumentBuilder();
            dbf.setIgnoringComments(true);
            dbf.setIgnoringElementContentWhitespace(true);
            document = db.parse(feriadosXML);
            document.getDocumentElement().normalize();
            xml = db.parse(MapaXML);
            xml.getDocumentElement().normalize();
        } catch (ParserConfigurationException | SAXException | IOException ex) {
        }
    }

    public boolean verifyIfcodEcists(ArrayList<Docente> arrayTemp, String cod) {
        boolean flag = false;
        for (int j = 0; j < arrayTemp.size(); j++) {
            if (cod.equals(arrayTemp.get(j).getCodDocente())) {
                flag = true;
            }
        }
        return flag;
    }

    public ArrayList<Docente> sortArray() {
        ArrayList<Docente> arrayTemp = new ArrayList<>();
        try {
            ArrayList<Docente> examesDocente = convertExamsMaptoList();

            for (int i = 0; i < examesDocente.size(); i++) {
                if ((arrayTemp.size() != 0) && (verifyIfcodEcists(arrayTemp, examesDocente.get(i).getCodDocente()) == true)) {
                    for (int j = 0; j < arrayTemp.size(); j++) {
                        if (examesDocente.get(i).getCodDocente().equals(arrayTemp.get(j).getCodDocente())) {
                            for (int k = 0; k < examesDocente.get(i).getExames().size(); k++) {
                                arrayTemp.get(j).getExames().add(examesDocente.get(i).getExames().get(k));
                            }
                        }

                    }

                } else if (arrayTemp.size() == 0) {

                    arrayTemp.add(new Docente(examesDocente.get(i).getCodDocente(), examesDocente.get(i).getExames()));

                } else {
                    arrayTemp.add(new Docente(examesDocente.get(i).getCodDocente(), examesDocente.get(i).getExames()));
                }
            }

        } catch (ParseException ex) {
            Logger.getLogger(XmlApprover.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrayTemp;
    }

    private ArrayList<Feriado> convertHolidaysXMLtoList() {
        Feriados f = new Feriados();
        ArrayList<Feriado> array = new ArrayList<>();

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        NodeList feriados = document.getChildNodes().item(0).getChildNodes();
        for (int i = 0; i < feriados.getLength(); i++) {
            if (feriados.item(i).getNodeType() == Node.ELEMENT_NODE) {
                NodeList feriado = feriados.item(i).getChildNodes();
                for (int j = 0; j < feriado.getLength() / 2; j++) {
                    try {
                        if (feriado.item(j).getNodeType() == Node.TEXT_NODE && feriado.item(j).getNodeValue().trim().length() == 0) {
                            continue;
                        }
                        Feriado fer = new Feriado(formatter.parse(feriado.item(j).getTextContent()), feriado.item(j + 2).getTextContent());
                        array.add(fer);

                    } catch (ParseException ex) {
                        Logger.getLogger(XmlApprover.class
                                .getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
        return array;
    }

    public ArrayList<Docente> convertExamsMaptoList() throws ParseException {
        ArrayList<Docente> examesDocente = new ArrayList<>();
        ArrayList<Exame> examesT = new ArrayList<>();
        Date dia = null;
        Date hora = null;
        String codDocente = "";
        String nomeUc = "";
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat formatterHour = new SimpleDateFormat("HH:mm:ss");
        try {
            XPathFactory factory = XPathFactory.newInstance();
            XPath xpath = factory.newXPath();
            XPathExpression expr = xpath.compile("/mapa/cursos/curso");
            Object result = expr.evaluate(xml, XPathConstants.NODESET);

            NodeList cursos = (NodeList) result;
            for (int i = 0; i < cursos.getLength(); i++) {
                Node n = cursos.item(i);
                if (n != null && n.getNodeType() == Node.ELEMENT_NODE) {
                    Element curso = (Element) n;
                    NodeList uc = curso.getChildNodes();
                    for (int j = 0; j < uc.getLength(); j++) {
                        if (uc.item(j).getNodeName().equals("unidadesCurriculares")) {
                            NodeList unidades = uc.item(j).getChildNodes();
                            for (int k = 0; k < unidades.getLength(); k++) {
                                if (unidades.item(k).getNodeName().equals("unidadeCurricular")) {
                                    NodeList epocas = unidades.item(k).getChildNodes();
                                    for (int z = 0; z < epocas.getLength(); z++) {
                                        if (epocas.item(z).getNodeName().equals("nome")) {
                                            nomeUc = epocas.item(z).getTextContent();
                                        }
                                        if (epocas.item(z).getNodeName().equals("responsavel")) {

                                            NodeList detalhesResponsavel = epocas.item(z).getChildNodes();
                                            for (int t = 0; t < detalhesResponsavel.getLength(); t++) {
                                                if (detalhesResponsavel.item(t).getNodeName().equals("cod")) {
                                                    codDocente = detalhesResponsavel.item(t).getTextContent();
                                                }
                                            }

                                        }
                                        if (epocas.item(z).getNodeName().equals("epocas")) {
                                            NodeList exames = epocas.item(z).getChildNodes();
                                            for (int u = 0; u < exames.getLength(); u++) {

                                                if (exames.item(u).getNodeName().equals("epoca")) {
                                                    NodeList exame = exames.item(u).getChildNodes();
                                                    for (int t = 0; t < exame.getLength(); t++) {
                                                        if (exame.item(t).getNodeName().equals("exame")) {
                                                            NodeList desc = exame.item(t).getChildNodes();
                                                            for (int y = 0; y < desc.getLength(); y++) {
                                                                if (desc.item(y).getNodeName().equals("dia")) {
                                                                    dia = formatter.parse(desc.item(y).getTextContent());
                                                                }
                                                                if (desc.item(y).getNodeName().equals("hora")) {
                                                                    hora = formatterHour.parse(desc.item(y).getTextContent());
                                                                }

                                                            }
                                                            examesT.add(new Exame(nomeUc, dia, hora));
                                                        }
                                                    }
                                                    examesDocente.add(new Docente(codDocente, examesT));
                                                    examesT = new ArrayList<>();
                                                }

                                            }
                                        }
                                    }

                                }
                            }
                        }
                    }

                }

            }
        } catch (XPathExpressionException ex) {
            Logger.getLogger(XmlApprover.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return examesDocente;
    }

//    public void getExams() throws XPathExpressionException {
//
//        XPathFactory xPathfactory = XPathFactory.newInstance();
//        XPath xpath = xPathfactory.newXPath();
//
//        XPathExpression expr = xpath.compile("/mapa/cursos/curso");
//        NodeList nl = (NodeList) expr.evaluate(xml, XPathConstants.NODESET);
//        for (int i = 0; i < nl.getLength(); i++) {
//            Element el = (Element) nl.item(i);
//            XPathExpression expr2 = xpath.compile("//unidadesCurriculares/unidadeCurricular");
//            NodeList nl2 = (NodeList) expr2.evaluate(xml, XPathConstants.NODESET);
//            for (int j = 0; j < nl2.getLength(); j++) {
//                System.out.println(nl2.item(j).getChildNodes());
//            }
//        }
//    }
    public ArrayList<Errors> runXMLMAP() {
        ArrayList<Errors> erros = new ArrayList<>();

        String uCurricular = "";
        try {
            XpathEvaluator eval = new XpathEvaluator();

            // int count = Integer.parseInt(applyXpathExpressionToString("count(/mapa/cursos/curso)", document));
            XPathFactory factory = XPathFactory.newInstance();
            XPath xpath = factory.newXPath();
            XPathExpression expr = xpath.compile("/mapa/cursos/curso");
            Object result = expr.evaluate(xml, XPathConstants.NODESET);

            NodeList cursos = (NodeList) result;

            for (int i = 0; i < cursos.getLength(); i++) {
                Node n = cursos.item(i);
                if (n != null && n.getNodeType() == Node.ELEMENT_NODE) {
                    Element curso = (Element) n;
                    NodeList uc = curso.getChildNodes();
                    for (int j = 0; j < uc.getLength(); j++) {
                        if (uc.item(j).getNodeName().equals("unidadesCurriculares")) {
                            NodeList unidades = uc.item(j).getChildNodes();
                            for (int k = 0; k < unidades.getLength(); k++) {
                                if (unidades.item(k).getNodeName().equals("unidadeCurricular")) {

                                    NodeList epocas = unidades.item(k).getChildNodes();
                                    for (int z = 0; z < epocas.getLength(); z++) {
                                        if (epocas.item(z).getNodeName().equals("nome")) {
                                            uCurricular = epocas.item(z).getTextContent();
                                        }
                                        if (epocas.item(z).getNodeName().equals("epocas")) {
                                            NodeList exames = epocas.item(z).getChildNodes();
                                            for (int t = 0; t < exames.getLength(); t++) {
                                                if (exames.item(t).getNodeName().equals("epoca")) {
                                                    NodeList exame = exames.item(t).getChildNodes();
                                                    for (int u = 0; u < exame.getLength(); u++) {
                                                        if (exame.item(u).getNodeName().equals("exame")) {
                                                            NodeList desc = exame.item(u).getChildNodes();
                                                            for (int y = 0; y < desc.getLength(); y++) {
                                                                if (desc.item(y).getNodeName().equals("dia")) {
                                                                    String data = desc.item(y).getTextContent();

                                                                    if (approveDate(data) == true) {
                                                                        erros.add(new Errors("<erro" + uCurricular + " tem exame marcado num feriado<erro>"));

                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (XPathExpressionException ex) {
            Logger.getLogger(XmlApprover.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return erros;
    }

    public boolean approveDate(String data) {
        ArrayList<Feriado> feriados = convertHolidaysXMLtoList();
        boolean flag = false;
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date datas = formatter.parse(data);
            for (Feriado fe : feriados) {
                if (fe.getData().equals(datas)) {
                    flag = true;

                }
            }
        } catch (ParseException ex) {
            Logger.getLogger(XmlApprover.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return flag;
    }

    @Override
    public boolean approveNumberExamsDayUC() {
        ArrayList<Errors> erros = new ArrayList<>();
        boolean flag = false;
        if (validaXML() == true) {
            try {
                InputStream inputStream = new FileInputStream(new File("./files/test.xquery"));

                XQDataSource ds = new SaxonXQDataSource();
                XQConnection conn = ds.getConnection();
                XQPreparedExpression exp = conn.prepareExpression(inputStream);
                XQResultSequence result = exp.executeQuery();

                while (result.next()) {

                    System.out.println(result.getItemAsString(null));

                }

            } catch (FileNotFoundException e) {
                System.out.println("FILE   NOT   FOUND");
            } catch (XQException ex) {

            }
            return flag;
        } else {
            return false;
        }
    }

    @Override
    public boolean approveTeacheronExam() {
        ArrayList<Errors> erros = new ArrayList<>();
        ArrayList<Docente> array = sortArray();
        if (validaXML() == true) {
            for (int i = 0; i < array.size(); i++) {
                for (int j = 0; j < array.get(i).getExames().size(); j++) {
                    for (int k = 1; k < array.get(i).getExames().size(); k++) {

                        if ((array.get(i).getExames().get(j).getUnidadeCurricular() != array.get(i).getExames().get(k).getUnidadeCurricular()) && (j != k)) {
                            if ((array.get(i).getExames().get(j).getDia().equals(array.get(i).getExames().get(k).getDia())) && (array.get(i).getExames().get(j).getHora().equals(array.get(i).getExames().get(k).getHora()))) {
                                erros.add(new Errors("O professor " + array.get(i).getCodDocente() + "" + array.get(i).getExames().get(j).getUnidadeCurricular() + "tem um exame marcado no mesmo dia e hora de " + array.get(i).getExames().get(k).getUnidadeCurricular()));
                                break;
                            }
                        }

                    }

                }
            }
        } else {
            erros.add(new Errors("A sintaxe do documento não é valida"));
        }
        System.out.println("ola");
        if (!erros.isEmpty()) {
            for (int i = 0; i < erros.size(); i++) {
                System.out.println(erros.get(i).getErro());
            }
            return true;
        } else {
            return false;
        }

    }

    @Override
    public boolean approveExamHolidays() {
        ArrayList<Errors> erros = runXMLMAP();
        if (validaXML() == true) {

            for (int i = 0; i < erros.size(); i++) {
                System.out.println(erros.get(i).getErro());
            }

        } else {
            erros.add(new Errors("A sintaxe do documento não é valida"));
        }

        if (!erros.isEmpty()) {
            for (int i = 0; i < erros.size(); i++) {
                System.out.println(erros.get(i).getErro());
            }
            return true;
        } else {
            return false;
        }
    }
}
