/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.test;

import java.util.List;
import pe.edu.upeu.config.Conexion;
import pe.edu.upeu.dao.ContratoDAO;
/**
 *
 * @author Leandro Burgos
 */
public class testSettings {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       testConnection();
        //listarA();
        //leer();
       
    }
 public static ContratoDAO hD = new ContratoDAO();
    public static void testConnection() {
        if (Conexion.getConexion()!=null) {
            System.out.println("Conectado");
        }else{
            System.out.println("Desconectado");
        }
    }
  /*  
      public static void listarA() {
        String[][] datos = hD.listarContrato();
        try {
            for (String[] dato : datos) {
                int a = 0;
                while (dato[a] != null) {
                    System.out.println(dato[a]);
                    a++;
                }
            }
        } catch (Exception e) {
            System.out.println("Error " + e);
        }
    }
      public static void leer(){
        String[][] p=hD.listarContrato();
        for (String[] dato : p) {
            System.out.println(dato[1]);
            System.out.println(dato[2]);
            System.out.println(dato[3]);
        }    
    }
*/
    }
