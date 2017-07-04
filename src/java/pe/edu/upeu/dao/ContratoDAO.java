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
import java.util.Map;
import pe.edu.upeu.config.Conexion;

/**
 *
 * @author SONY
 */
public class ContratoDAO {
    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;
    
    /*public static String[][] listarContrato() {
        Conexion oConexion = new Conexion();
        StringBuilder sql = new StringBuilder();
       
        sql.append("SELECT * FROM PERSONA P, CONTRATO C, SUELDO S, RENUMERACIONes R ");
        sql.append("WHERE C.IDCONTRATO=S.IDCONTRATO ");
        sql.append("AND C.IDPERSONA=P.IDPERSONA ");
        sql.append("AND R.IDSUELDO=S.IDSUELDO; ");

        String resultadolistContra[][] = null;
        try {

            ResultSet rs = oConexion.query(sql.toString());
            //ResultSetMetaData rsmd = rs.getMetaData(); para obtener cantidad de columnas
            //int columnsNumber = rsmd.getColumnCount(); para obtener cantidad de columnas
            rs.last();
            int rows = rs.getRow();
            rs.beforeFirst();
            int contador = 0;
            resultadolistContra = new String[rows][12];
            while (rs.next()) {
                resultadolistContra[contador][0] = (rs.getString("NOMBRES"));
                resultadolistContra[contador][1] = (rs.getString("APELLIDOS"));
                resultadolistContra[contador][2] = (rs.getString("DNI"));
                resultadolistContra[contador][3] = (rs.getString("FECHAINGRESO"));
                resultadolistContra[contador][4] = (rs.getString("FECHASALIDA"));
                resultadolistContra[contador][5] = (rs.getString("CARGO"));
                resultadolistContra[contador][6] = (rs.getString("ASIGFAMILIAR"));
                resultadolistContra[contador][7] = (rs.getString("DLABORALES"));
                resultadolistContra[contador][8] = (rs.getString("HLABORALES"));
                resultadolistContra[contador][9] = (rs.getString("SUELDOBASICO"));
                resultadolistContra[contador][10] = (rs.getString("HEXTRAS"));
                resultadolistContra[contador][11] = (rs.getString("BONO"));

                contador++;
            }
        } catch (SQLException e) {
        } finally {

        }
        return resultadolistContra;

    }*/
    public ArrayList<Map<String, ?>> getcargo(){
        sql = "SELECT idcargo,nombre from cargo";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id", rs.getString("idcargo"));
                m.put("cargo", rs.getString("nombre"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar cargos Disponibles " + e);
            return null;
        }finally{
            Conexion.cerrar();
        }
        return lista;
    }
    public int gethired(String nombre, String dni,String ap,String idcargo, String fini,String ffin,String hrlab,String dlab,String asignf,String sbase,String pension) {
        int n = 0;
        sql = "{CALL createPersona(?,?,?)}";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareCall(sql);
            ps.setString(1, nombre);
            ps.setString(2, ap);
            ps.setString(3, dni);
            rs = ps.executeQuery();
            int idpersona=0;
            while(rs.next()){
                idpersona=rs.getInt("idpersona");
            }
            System.out.println("persona "+idpersona );
            sql="insert into contrato(idpersona,fechaingreso,fechasalida,idcargo,asigfamiliar,dlaborales,hlaborales,sueldobasico,idafiliacion) values (?,?,?,?,?,?,?,?,?)";
            ps=cn.prepareStatement(sql);
            ps.setInt(1, idpersona);
            ps.setString(2, fini);
            ps.setString(3, ffin);
            ps.setInt(4, Integer.parseInt(idcargo));
            ps.setString(5, asignf);
            ps.setString(6, dlab);
            ps.setString(7, hrlab);
            ps.setDouble(8, Double.parseDouble(sbase));
            ps.setInt(9, Integer.parseInt(pension));
            n=ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error al agregar contrato al registro " + ex);
        }finally{
            Conexion.cerrar();
        }
        return n;
    }
}
