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
import java.util.ArrayList;
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

    public ArrayList<Map<String, ?>> validarPayroll() {
        ArrayList<Map<String, ?>> r = new ArrayList<>();
        sql = "select * from contrato c,sueldo s,remuneraciones r,descuentos d,aportes a,persona p "
                + "where c.fechaingreso > '2015-04-05' "
                + "and c.fechasalida < '2018-06-08' "
                + "and p.idpersona=c.idpersona "
                + "and c.idcontrato=s.idcontrato "
                + "and d.idcontrato=c.idcontrato "
                + "and a.idcontrato=c.idcontrato "
                + "and r.idsueldo=s.idsueldo";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                //IDs
                d.put("idcontrato", rs.getInt("idcontrato"));
                d.put("idpersona", rs.getInt("idpersona"));
                d.put("idsueldo", rs.getInt("idcontrato"));
                d.put("idremu", rs.getInt("idremuneracion"));
                d.put("iddesc", rs.getInt("iddescuento"));
                d.put("idaporte", rs.getInt("idaportes"));
                //DATA
                d.put("persona", rs.getString("apellidos") + " " + rs.getString("nombres"));
                d.put("fechai", rs.getString("fechaingreso"));
                d.put("fechas", rs.getString("fechasalida"));
                d.put("cargo", rs.getString("cargo"));
                d.put("asigfamiliar", rs.getString("asigfamiliar"));
                d.put("dlab", rs.getString("dlaborales"));
                d.put("hlab", rs.getString("hlaborales"));
                d.put("sbasico", rs.getString("sueldobasico"));
                d.put("fsueldo", rs.getString("fecha"));
                d.put("hextra", rs.getString("hextras"));
                d.put("comisiones", rs.getString("comisiones"));
                d.put("bono", rs.getString("bono"));
                d.put("afp", rs.getString("afp"));
                d.put("onp", rs.getString("onp"));
                d.put("impuesto", rs.getString("quintacategoria"));
                d.put("otros", rs.getString("otros"));
                d.put("essalud", rs.getString("essalud"));
                d.put("senati", rs.getString("senati"));

                r.add(d);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            Conexion.cerrar();
        }
        return r;
    }

    public ArrayList<Map<String, ?>> listWorker(int id) {
        ArrayList<Map<String, ?>> r = new ArrayList<>();
        sql = "select * from contrato c,sueldo s,remuneraciones r,descuentos d,aportes a,persona p "
                + "where c.fechaingreso > '2015-04-05' "
                + "and c.fechasalida < '2018-06-08' "
                + "and p.idpersona=c.idpersona "
                + "and c.idcontrato=s.idcontrato "
                + "and d.idcontrato=c.idcontrato "
                + "and a.idcontrato=c.idcontrato "
                + "and r.idsueldo=s.idsueldo "
                + "and p.idpersona=? ";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                //IDs
                d.put("idcontrato", rs.getInt("idcontrato"));
                d.put("idpersona", rs.getInt("idpersona"));
                d.put("idsueldo", rs.getInt("idcontrato"));
                d.put("idremu", rs.getInt("idremuneracion"));
                d.put("iddesc", rs.getInt("iddescuento"));
                d.put("idaporte", rs.getInt("idaportes"));
                //DATA
                d.put("persona", rs.getString("apellidos") + " " + rs.getString("nombres"));
                d.put("fechai", rs.getString("fechaingreso"));
                d.put("fechas", rs.getString("fechasalida"));
                d.put("cargo", rs.getString("cargo"));
                d.put("asigfamiliar", rs.getString("asigfamiliar"));
                d.put("dlab", rs.getString("dlaborales"));
                d.put("hlab", rs.getString("hlaborales"));
                d.put("sbasico", rs.getString("sueldobasico"));
                d.put("fsueldo", rs.getString("fecha"));
                d.put("hextra", rs.getString("hextras"));
                d.put("comisiones", rs.getString("comisiones"));
                d.put("bono", rs.getString("bono"));
                d.put("afp", rs.getString("afp"));
                d.put("onp", rs.getString("onp"));
                d.put("impuesto", rs.getString("quintacategoria"));
                d.put("otros", rs.getString("otros"));
                d.put("essalud", rs.getString("essalud"));
                d.put("senati", rs.getString("senati"));

                r.add(d);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            Conexion.cerrar();
        }
        return r;
    }

}
