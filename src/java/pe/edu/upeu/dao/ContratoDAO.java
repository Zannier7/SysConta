/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.upeu.config.Conexion;

/**
 *
 * @author SONY
 */
public class ContratoDAO {
    
   /* 
    public static String[][] listarContrato() {
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

    }
    
   */
}
