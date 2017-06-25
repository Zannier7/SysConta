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
public class PayrollDAO {
    
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    public Map<String, Object> validarPayroll() {
        Map<String, Object> r = new HashMap<>();
        sql = "select * from contrato where fechasalida > sysdate()";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                r.put("idcontrato", rs.getInt("idcontrato"));
                r.put("idpersona", rs.getInt("idpersona"));
                return r;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            Conexion.cerrar();
        }
        return r;
    }
    
    
    
}
