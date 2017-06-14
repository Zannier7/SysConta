/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.test;

import pe.edu.upeu.config.Conexion;

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
    }
 
    public static void testConnection() {
        if (Conexion.getConexion()!=null) {
            System.out.println("Conectado");
        }else{
            System.out.println("Desconectado");
        }
    }
    
    
}
