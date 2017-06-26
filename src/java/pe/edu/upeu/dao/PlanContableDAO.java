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
import java.util.List;
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

    public static  List<Modelo_plancontable> listarPLANCONTABLE() {
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
}
