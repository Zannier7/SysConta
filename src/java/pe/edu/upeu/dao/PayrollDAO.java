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
        sql = "select p.idpersona,p.nombres pname,p.apellidos pape ,g.idcargo,g.nombre ocupacion,g.comision , "
                + "c.idcontrato,c.fechaingreso,c.fechasalida,c.asigfamiliar,c.hlaborales,c.dlaborales,c.sueldo,c.pension, "
                + "a.idaportes,a.essalud,a.senati,d.iddescuento,d.idafiliacion,d.impuesto,d.otros, "
                + "r.idremuneracion,r.idsueldo,r.hextras,r.comisiones,r.bono, "
                + "s.idsueldo,s.sueldobasico,s.fecha,l.tipo,l.nombre AO,l.interes "
                + "from contrato c,sueldo s,remuneraciones r,descuentos d,aportes a,persona p,cargo g,afiliacion l "
                + "where c.fechaingreso >= '2015-04-05' "
                + "and c.fechasalida <= '2018-06-08'  "
                + "and p.idpersona=c.idpersona "
                + "and c.idcontrato=s.idcontrato "
                + "and d.idsueldo=s.idsueldo "
                + "and a.idsueldo=s.idsueldo "
                + "and r.idsueldo=s.idsueldo "
                + "and c.idcargo=g.idcargo "
                + "and l.idafiliacion=d.idafiliacion ";
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
                d.put("idafiliacion", rs.getInt("idafiliacion"));
                //DATA
                d.put("persona", rs.getString("pape") + " " + rs.getString("pname"));
                d.put("fechai", rs.getString("fechaingreso"));
                d.put("fechas", rs.getString("fechasalida"));
                d.put("cargo", rs.getString("ocupacion"));
                d.put("afami", rs.getString("asigfamiliar"));
                d.put("dlab", rs.getString("dlaborales"));
                d.put("hlab", rs.getString("hlaborales"));
                d.put("sbasico", rs.getDouble("sueldobasico"));
                d.put("fsueldo", rs.getString("fecha"));
                d.put("hextra", rs.getInt("hextras"));
                d.put("comisiones", rs.getString("comisiones"));
                d.put("bono", rs.getDouble("bono"));
                d.put("impuesto", rs.getString("impuesto"));
                d.put("otros", rs.getString("otros"));
                d.put("essalud", rs.getString("essalud"));
                d.put("senati", rs.getString("senati"));
                d.put("tipo", rs.getInt("tipo"));
                d.put("AO", rs.getString("AO"));
                d.put("interes", rs.getString("interes"));
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
        sql = "select p.idpersona,p.nombres pname,p.apellidos pape ,g.idcargo,g.nombre ocupacion,g.comision , "
                + "c.idcontrato,c.fechaingreso,c.fechasalida,c.asigfamiliar,c.hlaborales,c.dlaborales,c.sueldo,c.pension, "
                + "a.idaportes,a.essalud,a.senati,d.iddescuento,d.idafiliacion,d.impuesto,d.otros, "
                + "r.idremuneracion,r.idsueldo,r.hextras,r.comisiones,r.bono, "
                + "s.idsueldo,s.sueldobasico,s.fecha,l.tipo,l.nombre AO,l.interes "
                + "from contrato c,sueldo s,remuneraciones r,descuentos d,aportes a,persona p,cargo g,afiliacion l "
                + "where c.fechaingreso >= '2015-04-05' "
                + "and c.fechasalida <= '2018-06-08'  "
                + "and p.idpersona=c.idpersona "
                + "and c.idcontrato=s.idcontrato "
                + "and d.idsueldo=s.idsueldo "
                + "and a.idsueldo=s.idsueldo "
                + "and r.idsueldo=s.idsueldo "
                + "and c.idcargo=g.idcargo "
                + "and l.idafiliacion=d.idafiliacion "
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
                d.put("idafiliacion", rs.getInt("idafiliacion"));
                //DATA
                d.put("persona", rs.getString("pape") + " " + rs.getString("pname"));
                d.put("fechai", rs.getString("fechaingreso"));
                d.put("fechas", rs.getString("fechasalida"));
                d.put("cargo", rs.getString("ocupacion"));
                d.put("afami", rs.getString("asigfamiliar"));
                d.put("dlab", rs.getString("dlaborales"));
                d.put("hlab", rs.getString("hlaborales"));
                d.put("sbasico", rs.getString("sueldobasico"));
                d.put("fsueldo", rs.getString("fecha"));
                d.put("hextra", rs.getString("hextras"));
                d.put("comisiones", rs.getString("comisiones"));
                d.put("bono", rs.getString("bono"));
                d.put("impuesto", rs.getString("impuesto"));
                d.put("otros", rs.getString("otros"));
                d.put("essalud", rs.getString("essalud"));
                d.put("senati", rs.getString("senati"));
                d.put("tipo", rs.getInt("tipo"));
                d.put("AO", rs.getString("AO"));
                d.put("interes", rs.getString("interes"));
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
