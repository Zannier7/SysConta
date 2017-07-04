
<%-- 
    Document   : diarybook
    Created on : 22/06/2017, 10:10:52 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import= "pe.edu.upeu.dao.PlanContableDAO"%>
<%@page import= "pe.edu.upeu.model.Modelo_plancontable"%> 



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
                $('#combo1').change(function () {
                    $('#codigo1').val($(this).val());
                    var des = $("#codigo1").val();
                    // alert(des);
                    $('#lb1').text(des);
                });
                $('#combo2').change(function () {
                    $('#codigo2').val($(this).val());
                    var des1 = $("#codigo2").val();
                    //alert(des);
                    $('#lb2').text(des1);

                });
                $('#combo3').change(function () {
                    $('#codigo3').val($(this).val());
                    var des2 = $("#codigo3").val();
                    //alert(des);
                    $('#lb3').text(des2);

                });

                $(".sumadebe").keyup(function ()
                {
                    var add = $(this).find("input[name=debe]").val();
                    var add1 = $(this).find("input[name=debe1]").val();
                    var add2 = $(this).find("input[name=debe2]").val();
                    $(this).find("[class=totaldebe]").html(parseInt(add) + parseInt(add1) + parseInt(add2));
                });

                $(".sumahaber").keyup(function () {

                    var a = $(this).find("input[name=haber1]").val();
                    var ab = $(this).find("input[name=haber2]").val();
                    var ab1 = $(this).find("input[name=haber3]").val();
                    $(this).find("[class=totalhaber]").html(parseInt(a) + parseInt(ab) + parseInt(ab1));
                });
            });



        </script>




    </head>
</head>
<body>

    <div class="sumadebe">
        <div class="sumahaber">
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
                            <th style="font-size: 15px">
                                <form action="#">
                                    <div class="form-control">
                                        <input class="mdl-textfield__input" type="text" id="fecha" disabled="" style="text-align: center"> 
                                    </div>
                                </form>                         
                            </th>
                            <th style="font-size: 15px; text-align: center">2015202635214</th>
                            <th style="font-size: 15px; text-align: center">Los Arnolds S.A</th>
                        </tr>
                    </tbody>

                </table>

                <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="kkk" cellspacing="0"  >
                    <thead>
                        <tr>

                            <th><center>Código Único de la Operación</center></th>
                    <th style="color: #558b2f"><center>Fecha de la Operación</center></th>
                    <th style="color: #e65100"><center>Descripción de la Operación</center></th>
                    <th style="color: #e65100">Código</th>
                    <th style="color: #01579b; text-align: center;">Denominación</th>
                    <th style="color: #d50000">Debe</th>
                    <th style="color: #d50000">Haber</th>
                    </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th style="text-align: center;">Total Debe <div class="totaldebe"><div class="total">0</div></th>
                            <th style="text-align: center;">Total Haber <div class="totalhaber"><div class="total">0</div></th>
                        </tr>
                    </tfoot>

                    <tbody class="tbodys" id="lineas">
                        <tr>
                            <td rowspan="3" style="text-align: center">1</td>
                            <td style="text-align: center">09/05/2017</td>
                            <td style="text-align: center">Por la Compra de Merca ;)</td>
                            <td style="text-align: center"><label style="text-align: center;" id="lb1">101</label></td>
                            <td style="text-align: center"> 
                                <div class="form-group">
                                    <label for="sel1">Select list:</label>
                                    <select class="form-control" id="combo1" >
                                        <% List<Modelo_plancontable> list = PlanContableDAO.listarPLANCONTABLE();%>
                                        <%for (int i = 0; i < list.size(); i++) {
                                                Modelo_plancontable Mplan = new Modelo_plancontable();
                                                Mplan = (Modelo_plancontable) list.get(i);%>
                                        <option style="text-align: center;" class="mdl-menu__item"  value="<%= Mplan.getCodigo()%>"><%= Mplan.getDescripcion()%></option> 
                                        <% }%>
                                        <input type="hidden" value="1" name="codigo1" id="codigo1"/>
                                    </select>
                                </div>                  
                            </td>
                            <td style="text-align: center; width: 10px;">
                                <div class="mdl-textfield mdl-js-textfield">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="debe" name="debe">
                                    <label class="mdl-textfield__label" for="debe">$$$$$</label>
                                    <span class="mdl-textfield__error">Solo números!</span>
                                </div>
                            </td>
                            <td style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="haber1" name="haber1">
                                    <label class="mdl-textfield__label" for="haber">$$$$$</label>
                                    <span class="mdl-textfield__error">Solo números!</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">09/05/2017</td>
                            <td style="text-align: center">Por la Compra de Merca ;)</td>
                            <td style="text-align: center"><label style="text-align: center;" id="lb2">101</label></td>
                            <td style="text-align: center"> 
                                <div class="form-group">
                                    <!--<label for="sel1">Select list:</label>-->
                                    <select class="form-control" id="combo2" >
                                        <%for (int i = 0; i < list.size(); i++) {
                                                Modelo_plancontable Mplan = new Modelo_plancontable();
                                                Mplan = (Modelo_plancontable) list.get(i);%>
                                        <option style="text-align: center;" class="mdl-menu__item"  value="<%= Mplan.getCodigo()%>"><%= Mplan.getDescripcion()%></option> 
                                        <% }%>
                                        <input type="hidden" value="2" name="codigo2" id="codigo2"/>
                                    </select>
                                </div>                  
                            </td>
                            <td style="text-align: center"> 
                                <div class="mdl-textfield mdl-js-textfield">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="debe1" name="debe1">
                                    <label class="mdl-textfield__label" for="debe">$$$$$</label>
                                    <span class="mdl-textfield__error">Solo números!</span>
                                </div>

                            </td>
                            <td style="text-align: center">

                                <div class="mdl-textfield mdl-js-textfield">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="haber2" name="haber2">
                                    <label class="mdl-textfield__label" for="haber">$$$$$</label>
                                    <span class="mdl-textfield__error">Solo números!</span>
                                </div>
                            </td>  
                            <td> 
                            </td>
                        </tr>


                        <tr>
                            <td style="text-align: center">09/05/2017</td>
                            <td style="text-align: center">Por la Compra de Merca ;)</td>
                            <td style="text-align: center"><label style="text-align: center;" id="lb3">101</label></td>
                            <td style="text-align: center"> 
                                <div class="form-group">
                                    <!--<label for="sel1">Select list:</label>-->
                                    <select class="form-control" id="combo3" >
                                        <%for (int i = 0; i < list.size(); i++) {
                                                Modelo_plancontable Mplan = new Modelo_plancontable();
                                                Mplan = (Modelo_plancontable) list.get(i);%>
                                        <option style="text-align: center;" class="mdl-menu__item"  value="<%= Mplan.getCodigo()%>"><%= Mplan.getDescripcion()%></option> 
                                        <% }%>
                                        <input type="hidden" value="3" name="codigo3" id="codigo3"/>
                                    </select>
                                </div>                  
                            </td>
                            <td style="text-align: center"> 
                                <div class="mdl-textfield mdl-js-textfield">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="debe2" name="debe2">
                                    <label class="mdl-textfield__label" for="debe">$$$$$</label>
                                    <span class="mdl-textfield__error">Solo números!</span>
                                </div>

                            </td>
                            <td style="text-align: center">

                                <div class="mdl-textfield mdl-js-textfield">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="haber3" name="haber3">
                                    <label class="mdl-textfield__label" for="haber">$$$$$</label>
                                    <span class="mdl-textfield__error">Solo números!</span>
                                </div>
                            </td>  
                            <td>  
                            </td>
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
    </div>




</body>

</html>
