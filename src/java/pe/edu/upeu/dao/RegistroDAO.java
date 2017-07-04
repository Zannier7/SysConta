/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import pe.edu.upeu.config.Conexion;

/**
 *
 * @author Leandro Burgos
 */
public class RegistroDAO {

    CallableStatement cs;
    PreparedStatement ps;
    Connection cn;
    String sql;
    ResultSet rs;

    public boolean UserROOT(String name, String ape, String dni, String user, String pass, String emp) {
        boolean r = false;
        int e = 0;
        int p = 0;
        sql = "{CALL createEmpresa(?)}";
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setString(1, emp);
            rs = cs.executeQuery();
            while (rs.next()) {
                e = rs.getInt("idpersona");
            }
            if (e > 0) {
                System.out.println("Empresa creada");
                sql = "{CALL createPersona(?,?,?)}";
                cs = Conexion.getConexion().prepareCall(sql);
                cs.setString(1, name);
                cs.setString(2, ape);
                cs.setString(3, dni);
                rs = cs.executeQuery();
                while (rs.next()) {
                    p = rs.getInt("idpersona");
                }
                if (p > 0) {
                    System.out.println("Persona creada");
                    cs = Conexion.getConexion().prepareCall("{CALL userROOT(?,?,?,?)}");
                    cs.setString(1, user);
                    cs.setString(2, pass);
                    cs.setInt(3, p);
                    cs.setInt(4, e);
                    rs = cs.executeQuery();
                    while (rs.next()) {
                        int a = rs.getInt("result");
                        if (a > 0) {
                            r = true;
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        } finally {
            Conexion.cerrar();
        }
        return r;
    }

}
