/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.dao;

import java.sql.CallableStatement;
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
public class UsuarioDAO {
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    public Map<String, Object> validarUser(String user, String pass) {
        Map<String, Object> r = new HashMap<>();
        sql = "select * from usuario where usuario=? and pass=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                r.put("idpersona", rs.getInt("idpersona"));
                r.put("idusuario", rs.getInt("idusuario"));
                r.put("idrol", rs.getInt("idrol"));
                return r;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            Conexion.cerrar();
        }
        return r;
    }
}
