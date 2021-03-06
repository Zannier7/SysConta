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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.config.Conexion;
import pe.edu.upeu.model.Modelo_plancontable;

/**
 *
 * @author SONY
 */
public class PlanContableDAO {

    static CallableStatement cs;
    static PreparedStatement ps;
    static Connection cn;
    static String sql;
    
    static ResultSet rs;

    public static List<Modelo_plancontable> listarPLANCONTABLE() {
        Conexion oConexion = new Conexion();

        sql = "SELECT * FROM PLANCONTABLE";
        List<Modelo_plancontable> list = new ArrayList();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Modelo_plancontable dto = new Modelo_plancontable();
                dto.setIdplancontable(rs.getInt("IDPLANCONTABLE"));
                dto.setCodigo(rs.getString("CODIGO"));
                dto.setDescripcion(rs.getString("DESCRIPCION"));

                list.add(dto);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static List<Modelo_plancontable> listarid(int id) {
        List<Modelo_plancontable> lista = new ArrayList();
        Modelo_plancontable dto = new Modelo_plancontable();
        sql = "SELECT * FROM PLANCONTABLE where IDPLANCONTABLE= ? ";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                dto.setIdplancontable(rs.getInt("IDPLANCONTABLE"));
                dto.setCodigo(rs.getString("CODIGO"));
                dto.setDescripcion(rs.getString("DESCRIPCION"));
                lista.add(dto);
            }
        } catch (Exception ex) {
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
        return lista;
    }

    public static String[][] listarPrueba(int id) {
        
        sql = "SELECT * FROM PLANCONTABLE where IDPLANCONTABLE= ? ";
        
        
        String listarPrueba[][] = null;

        //String[][] resultadoHistoProduct = new String[m][6];//apliar el 6
        listarPrueba = new String[0][3];
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            int contador = 0;
            while (rs.next()) {
                listarPrueba[contador][0] = (rs.getString("IDPLANCONTABLE"));
                listarPrueba[contador][1] = (rs.getString("CODIGO"));
                listarPrueba[contador][2] = (rs.getString("DESCRIPCION"));

                contador++;
            }
        } catch (SQLException e) {
            System.out.println("Error al listar historial " + e);
        }
        return listarPrueba;
    }
    
    public ArrayList<Map<String, ?>> listardiario() {
        ArrayList<Map<String, ?>> r = new ArrayList<>();
        sql = "SELECT * FROM PLANILLA P,DET_PLANILLA D WHERE P.IDPLANILLA=D.IDPLANILLA";
              
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("idplanilla", rs.getInt("idplanilla"));
                d.put("iddetplanilla", rs.getInt("iddetplanilla"));
                d.put("fecha", rs.getString("fecha"));
                d.put("ntotal", rs.getString("ntotal"));
                d.put("codigo", rs.getString("codigo"));
                d.put("denominacion", rs.getString("denominacion"));
                d.put("monto", rs.getString("monto"));
                d.put("movimiento", rs.getString("movimiento"));
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
