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
        sql = "select  "
                + "p.idpersona,p.nombres pname,p.apellidos pape ,g.idcargo,g.nombre ocupacion,g.comision ,  "
                + "c.idcontrato,c.fechaingreso,c.fechasalida,c.asigfamiliar,c.hlaborales,c.dlaborales,c.sueldobasico,  "
                + "s.idprev_sueldo,s.fecha,s.nhorase,s.bono,l.tipo,l.nombre AO,l.interes,l.idafiliacion   "
                + "from contrato c,persona p,cargo g,afiliacion l,prev_sueldo s "
                + "where c.idpersona=p.idpersona "
                + "and g.idcargo=c.idcargo "
                + "and l.idafiliacion=c.idafiliacion "
                + "and c.idcontrato=s.idcontrato "
                + "and c.fechaingreso >= '2015-04-05' "
                + "and c.fechasalida <= '2018-06-08'  "
                + "and s.fecha between c.fechaingreso and c.fechasalida";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                //IDs
                d.put("idcontrato", rs.getInt("idcontrato"));
                d.put("idpersona", rs.getInt("idpersona"));
                d.put("idprev_sueldo", rs.getInt("idprev_sueldo"));
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
                d.put("bono", rs.getDouble("bono"));
                d.put("fsueldo", rs.getString("fecha"));
                d.put("hextra", rs.getInt("nhorase"));
                d.put("comision", rs.getDouble("comision"));
                d.put("tipo", rs.getInt("tipo"));
                d.put("AO", rs.getString("AO"));
                d.put("interes", rs.getDouble("interes"));
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
        sql = "select  "
                + "p.idpersona,p.nombres pname,p.apellidos pape ,g.idcargo,g.nombre ocupacion,g.comision ,  "
                + "c.idcontrato,c.fechaingreso,c.fechasalida,c.asigfamiliar,c.hlaborales,c.dlaborales,c.sueldobasico,  "
                + "s.idprev_sueldo,s.fecha,s.nhorase,s.bono,l.tipo,l.nombre AO,l.interes,l.idafiliacion   "
                + "from contrato c,persona p,cargo g,afiliacion l,prev_sueldo s "
                + "where c.idpersona=p.idpersona "
                + "and g.idcargo=c.idcargo "
                + "and l.idafiliacion=c.idafiliacion "
                + "and c.idcontrato=s.idcontrato "
                + "and c.fechaingreso >= '2015-04-05' "
                + "and c.fechasalida <= '2018-06-08'  "
                + "and s.fecha between c.fechaingreso and c.fechasalida "
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
                d.put("idprev_sueldo", rs.getInt("idprev_sueldo"));
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
                d.put("bono", rs.getDouble("bono"));
                d.put("fsueldo", rs.getString("fecha"));
                d.put("hextra", rs.getInt("nhorase"));
                d.put("comision", rs.getDouble("comision"));
                d.put("tipo", rs.getInt("tipo"));
                d.put("AO", rs.getString("AO"));
                d.put("interes", rs.getDouble("interes"));
                r.add(d);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            Conexion.cerrar();
        }
        return r;
    }

    public int Reg_planilla() {
        int s = 0;
        try {
            sql = "insert into planilla values (null,sysdate())";
            ps = Conexion.getConexion().prepareCall(sql);
            s = ps.executeUpdate();
            if (s > 0) {
                sql = "select max(idplanilla) idplanilla from planilla";
                ps = Conexion.getConexion().prepareCall(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    s = rs.getInt("idplanilla");
                }
            }
        } catch (Exception e) {
            System.out.println("Error al registrar planilla : " + e);
        }
        return s;
    }

    public boolean add(Object o) {
        boolean p = false;
        sql = "INSERT INTO det_planilla VALUES(null,?,?,?,?,?,?)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("id").toString()));
            ps.setInt(2, Integer.parseInt(m.get("asiento").toString()));
            ps.setInt(3, Integer.parseInt(m.get("codigo").toString()));
            ps.setString(4, m.get("denominacion").toString());
            ps.setDouble(5, Double.parseDouble(m.get("monto").toString()));
            ps.setInt(6, Integer.parseInt(m.get("tipo").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar DETPLANILLA " + e);
            p = false;
        }
        return p;
    }
    
    
}
