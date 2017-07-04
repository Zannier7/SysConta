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
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.config.Conexion;

/**
 *
 * @author César
 */
public class SettingsDao {

    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    String sql = "";

    public Map<String, Object> getuit() {
        sql = "select * from data_empresa";
        Map<String, Object> s = new HashMap<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                s.put("id", rs.getInt("idPlanillaconfig"));
                s.put("uit", rs.getDouble("uit"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return s;
        }
    }

    public int modifyuit(String valor) {
        int i = 0;
        sql = "update data_empresa set uit=? where 1=1";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setDouble(1, Double.parseDouble(valor));
            i=ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int createafp(String nombre, String tipo, String interes) {
        int i = 0;
        sql = "insert into afiliacion(tipo,nombre,interes) values (?,?,?)";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(i, tipo);
            ps.setString(2, nombre);
            ps.setDouble(3, Double.parseDouble(interes));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return i;
        }
    }

    public ArrayList<Map<String, Object>> listafp() {
        sql = "select * from afiliacion";
        ArrayList<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> s = new HashMap<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                s.put("id", rs.getInt("idafiliacion"));
                s.put("tipo", rs.getString("tipo"));
                s.put("nombre", rs.getString("nombre"));
                s.put("interes", rs.getDouble("interes"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return list;
        }
    }

    public int modifyafp(String nombre, String interes, String id) {
        int i = 0;
        sql = "update afiliacion set nombre=?,interes=? where idafiliacion=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setDouble(2, Double.parseDouble(interes));
            ps.setInt(3, Integer.parseInt(id));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return i;
        }
    }

    public int deleteafp(String id) {
        int i = 0;
        sql = "delete from afiliacion where idafiliacion=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return i;
        }
    }

    public int createcargo(String nombre, String comision) {
        int i = 0;
        sql = "insert into cargo(nombre,comision) values (?,?)";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(i, nombre);
            ps.setDouble(2, Double.parseDouble(comision));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return i;
        }
    }

    public ArrayList<Map<String, Object>> listcargo() {
        sql = "select * from cargo";
        ArrayList<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> s = new HashMap<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                s.put("id", rs.getInt("idcargo"));
                s.put("nombre", rs.getString("nombre"));
                s.put("comision", rs.getDouble("comision"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return list;
        }
    }

    public int modifycargo(String nombre, String comision, String id) {
        int i = 0;
        sql = "update cargo set nombre=?,comision=? where idcargo=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(i, nombre);
            ps.setDouble(2, Double.parseDouble(comision));
            ps.setInt(3, Integer.parseInt(id));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return i;
        }
    }

    public int deletecargo(String id) {
        int i = 0;
        sql = "delete from cargo where idcargo=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.cerrar();
            return i;
        }
    }
}
