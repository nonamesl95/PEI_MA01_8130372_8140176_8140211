package core;

import core.utilities.SimpleErrorHandler;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class GestorXML {

    private final String xmlFile, xsdFile;
    private Document document;

    /**
     *
     * @param xmlFile Documento XML a processar
     * @param xsdFile Documento XSD a processar
     */
    public GestorXML(String xmlFile, String xsdFile) {
        this.xmlFile = xmlFile;
        this.xsdFile = xsdFile;
    }

    /**
     * Método responsável por retornar o {@link org.w3c.dom.Document documento} previamente carregado
     * 
     * @return o {@link org.w3c.dom.Document documento} previamente carregado
     */
    public Document getDocument() {
        return document;
    }
    
    
    /**
     * Método responsável por validar um documento XML com o seu schema
     *
     * @param xml Documento XML a processar
     * @param xsd Documento XSD a processar
     * @param logOnError permite ativar/desativas as mensagens de erro que
     * possam surgir através da linha de comandos
     * @return valor booleano sinalizando sucesso/insucesso da operação
     */
    public static boolean validate(File xml, File xsd, boolean logOnError) {
        Source schemaFile = new StreamSource(xsd), xmlFile = new StreamSource(xml);
        SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        try {
            Schema schema = schemaFactory.newSchema(schemaFile);
            Validator validator = schema.newValidator();
            validator.setErrorHandler(new SimpleErrorHandler());
            validator.validate(xmlFile);
        } catch (SAXException | IOException ex) {
            if (logOnError) {
                Logger.getLogger(GestorXML.class.getName()).log(Level.SEVERE, null, ex.getMessage());
            }
            return false;
        }
        return true;
    }

    private static void printAttributes(Node node, int currentIdentation) {
        String add_blanks = currentIdentation != 0 ? String.format("%" + currentIdentation + "s", "") : "";
        NamedNodeMap attributes = node.getAttributes();
        for (int i = 0; i < attributes.getLength(); ++i) {
            Node att = attributes.item(i);
            System.out.println(add_blanks + " " + att.getNodeName() + ": " + att.getNodeValue());
        }
    }

    public static void listNode(Node node, boolean printAttributes, boolean printChilds, int currentIdentation) {
        String add_blanks = currentIdentation != 0 ? String.format("%" + currentIdentation + "s", "") : "";
        if (node.getNodeType() == Node.TEXT_NODE) {
            String text = node.getNodeValue().trim();
            if (text.length() > 0) {
                System.out.println(add_blanks + "valor: " + text);
            }
        } else {
            System.out.println(add_blanks + node.getNodeName());
            if (printAttributes) {
                GestorXML.printAttributes(node, currentIdentation + 1);
            }
        }
        NodeList list = node.getChildNodes();
        for (int i = 0; i < list.getLength(); i++) {
            short type = list.item(i).getNodeType();
            if ((printChilds && (type == Node.ELEMENT_NODE || type == Node.TEXT_NODE))
                    || (!printChilds && type == Node.TEXT_NODE)) {
                GestorXML.listNode(list.item(i), printAttributes, printChilds, currentIdentation + 1);
            }
        }
    }

    /**
     * Método responsável por ler (parse) um documento XML
     *
     * @param logOnError permite ativar/desativas as mensagens de erro que
     * possam surgir através da linha de comandos
     * @return valor booleano sinalizando sucesso/insucesso da operação
     */
    public boolean read(boolean logOnError) {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db;
        try {
            db = dbf.newDocumentBuilder();
            dbf.setIgnoringComments(true);
            dbf.setIgnoringElementContentWhitespace(true);
            document = db.parse(this.xmlFile);
            document.getDocumentElement().normalize();
        } catch (ParserConfigurationException | SAXException | IOException ex) {
            if (logOnError) {
                Logger.getLogger(GestorXML.class.getName()).log(Level.SEVERE, null, ex.getMessage());
            }
            return false;
        }
        return true;
    }

    /**
     * Método que permite validar um documento XML previamento definido com o
     * seu schema também previamente definido. Sem a existência de um xsd
     * retorna "true"
     *
     * @param output permite ativar/desativas as mensagens de erro que possam
     * surgir através da linha de comandos
     * @return
     */
    public boolean validate(boolean output) {
        return xsdFile == null || xsdFile.isEmpty() ? true : GestorXML.validate(new File(xmlFile), new File(xsdFile), output);
    }

    /**
     * Método responsável por imprimir o documento
     *
     * @param printAttributes valor booleano sinalizando se os atributos devem
     * ser imprimidos
     * @param printChilds valor booleano sinalizando se os filhos devem ser
     * imprimidos
     */
    public void print(boolean printAttributes, boolean printChilds) {
        Node root = document.getDocumentElement();
        GestorXML.listNode(root, printAttributes, printChilds, 0);
    }

    /**
     * Método responsável por imprimir o conteúdo de elemento
     *
     * @param name nome do elemento a imprimir
     * @param printAttributes valor booleano sinalizando se os atributos devem
     * ser imprimidos
     * @param printChilds valor booleano sinalizando se os filhos devem ser
     * imprimidos
     */
    public void print(String name, boolean printAttributes, boolean printChilds) {
        NodeList nodes = document.getElementsByTagName(name);
        for (int i = 0; i < nodes.getLength(); ++i) {
            GestorXML.listNode(nodes.item(i), printAttributes, printChilds, 0);
        }
    }

    /**TODO
     * 2. Crie um método que tendo por base a interface: XMLSerializable 
     * (disponível na plataforma moodle), 
     * realize o mapeamento do conteúdo do documento XML para a classe tendo 
     * em conta as regras definidas pelo método: XMLToClassBinding;
     */
}
