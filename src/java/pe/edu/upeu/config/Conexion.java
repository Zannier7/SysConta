    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Leandro Burgos
 */
public class Conexion {
    private static final String url = "jdbc:mysql://localhost/dbconta";
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String user = "root";
    private static final String clave = "";
    private static Connection conn = null;

    public static Connection getConexion() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, clave);
        } catch (ClassNotFoundException e) {
            System.out.println("Error Class Not Found : " + e);
        } catch (SQLException e) {
            System.out.println("#Error SQL : " + e);
        }
        return conn;
    }
    
   public ResultSet query(String sql) {

        Statement st;
        ResultSet rs = null;
        try {
            Connection conexion = this.getConexion();
            st = conexion.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }
    
    
    public static void cerrar() {
        try {
            if (!conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
