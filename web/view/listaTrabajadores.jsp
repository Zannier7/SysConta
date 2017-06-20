<%-- 
    Document   : listaTrabajadores
    Created on : 20/06/2017, 10:38:54 AM
    Author     : SONY
--%>
<%@page import="pe.edu.upeu.dao.ContratoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link href="../resources/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        <title>JSP Page</title>
    </head>
    <body>
    <body class="hold-transition skin-blue sidebar-mini">
        <section class="content-header" style="text-align: center;">
            <h2>
                "Trabajadores Contratados"
                <small>Sys_Conta</small>
            </h2>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                  
                        <div class="box-header">
                            <h3 class="box-title">Lista de Trabajadores Contratados</h3>
                        </div>
                        <table  class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--3dp" style="text-align:center">
                            <tr><td><strong>NOMBRES</strong></td>
                                <td><strong>APELLIDOS</strong></td>
                                <td><strong>DNI</strong></td>
                                <td><strong>FECHA INGRESO</strong></td>
                                <td><strong>FECHA SALIDA</strong></td>
                                <td><strong>CARGO</strong></td>
                                <td><strong>ASIGNACIÓN FAMILIAR</strong></td>
                                <td><strong>DIAS LABORALES</strong></td>
                                <td><strong>HORAS LABORALES</strong></td>
                                <td><strong>SUELDO BÁSICO</strong></td>
                                <td><strong>HORAS EXTRAS</strong></td>
                                <td><strong>BONO</strong></td> </tr>
                            <% String lista[][] = ContratoDAO.listarContrato();%>
                            <%for (int i = 0   ; i < lista.length; i++) {%>
                            <tr><td style="text-align: center"><%=lista[i][0]%></td>
                                <td style="text-align: center"><%=lista[i][1]%></td>
                                <td style="text-align: center"<%=lista[i][2]%></td>
                                <td style="text-align: center"><%=lista[i][3]%></td>
                                <td style="text-align: center"><%=lista[i][4]%></td>
                                <td style="text-align: center"><%=lista[i][5]%></td>
                                <td style="text-align: center"><%=lista[i][6]%></td>
                                <td style="text-align: center"><%=lista[i][7]%></td>
                                <td style="text-align: center"><%=lista[i][8]%></td>
                                <td style="text-align: center"><%=lista[i][9]%></td>
                                <td style="text-align: center"><%=lista[i][10]%></td>
                                <td style="text-align: center"><%=lista[i][11]%></td>
                            </tr>
                           <% }%>  
                        </table>
                    </div>
                </div>
            </div>
        </section>            
                                   
        
        

    </body>
</body>
</html>
