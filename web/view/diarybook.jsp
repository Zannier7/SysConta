<%-- 
    Document   : diarybook
    Created on : 22/06/2017, 10:10:52 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import= "pe.edu.upeu.dao.PlanContableDAO"%>
<%@page import= "pe.edu.upeu.model.Modelo_plancontable"%> 
<jsp:useBean id="hola" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="es" style="overflow-y: hidden">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DiaryBook</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
         <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('#comboP').change(function () {
                    $('#idplan').val($(this).val());
                    var id = $("#idplan").val();
                    alert(id);
                    
                      
                    
                });


            });


        </script>
 
        
        
        
    </head>
</head>
<body>
    <div>
        <center>
            <h1>LIBRO DIARIO</h1>

            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" cellspacing="0">

                <thead>
                    <tr>
                        <th style="color:#009999; font-size: 15px;; text-align: center">Periodo</th>
                        <th style="color:#e65100; font-size: 15px; text-align: center">RUC</th>
                        <th style="color: #01579b; font-size: 15px; text-align: center">Razón Social</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th style="font-size: 15px; text-align: center">2009</th>
                        <th style="font-size: 15px; text-align: center">2015202635214</th>
                        <th style="font-size: 15px; text-align: center">Los Arnolds S.A</th>
                    </tr>
                </tbody>

            </table>
            <br/><br/>
            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="kkk" cellspacing="0" >
                <thead>
                    <tr>

                        <th><center>Código Único de la Operación</center></th>
                <th style="color: #558b2f"><center>Fecha de la Operación</center></th>
                <th style="color: #e65100"><center>Descripción de la Operación</center></th>
                <th style="color: #e65100">Código</th>
                <th style="color: #01579b">Denominación</th>
                <th style="color: #d50000">Debe</th>
                <th style="color: #d50000">Haber</th>
                </tr>

                </thead>
                <tbody class="tbodys">
                    <tr>
                        <td style="text-align: center">1</td>
                        <td style="text-align: center">09/05/2017</td>
                        <td style="text-align: center">Por la Compra de Merca ;)</td>
                        <td style="text-align: center"><div class="form-group">
                            <!--<label for="sel1">Select list:</label>-->
                            <select class="form-control" id="comboP" >
                                <% List<Modelo_plancontable> list = PlanContableDAO.listarPLANCONTABLE();%>
                                <%for (int i = 0; i < list.size(); i++) {
                                        Modelo_plancontable Mplan = new Modelo_plancontable();
                                        Mplan = (Modelo_plancontable) list.get(i);%>
                                <option class="mdl-menu__item"  value="<%= Mplan.getIdplancontable()%>"><%= Mplan.getCodigo()%></option> 


                                <% }%>
                                <input type="hidden" value="1" name="idplan" id="idplan"/>
                            </select>

                        </div></td>
                        <td style="text-align: center">cargar merca</td>
                        <td style="text-align: center">500</td>
                        <td style="text-align: center">500</td>
                    </tr>
                </tbody>

            </table>    
            <br>
            <br>
            <br>
            <br>
            <h1>creo que debería ser un formulario :)...</h1>
        </center>
    </div>
    
</body>
</html>
