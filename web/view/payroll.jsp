<%-- 
    Document   : payroll
    Created on : 13/06/2017, 12:04:26 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-y: hidden">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </head>
    <body>
        <div>
            <center>
                <h1>Planilla</h1>
                <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="kkk" cellspacing="0" >
                    <thead>
                        <tr>
                            <th colspan="3"><center>Datos del Trabajador</center></th>
                    <th colspan="3" style="color: #558b2f"><center>Remuneraciones</center></th>
                    <th colspan="3" style="color: #e65100"><center>Descuentos</center></th>
                    <th colspan="2" style="color: #01579b"><center>Aportes</center></th>
                    <th colspan="1" style="color: #d50000"><center>Monto a Pagar</center></th>
                    </tr>
                    <tr>
                        <th class="tra">Apellidos y Nombres</th>
                        <th class="tra">Ocupación</th>
                        <th></th>

                        <th style="color: #558b2f">Sueldo Básico</th>
                        <th style="color: #558b2f">Total</th>
                        <th></th>

                        <th style="color: #e65100">Imp. Renta</th>
                        <th style="color: #e65100">Total</th>
                        <th></th>

                        <th style="color: #01579b">Total</th>
                        <th></th>

                        <th style="color: #d50000">Total</th>
                    </tr>

                    </thead>
                    <tbody class="tbodys">
                        <tr>
                            <td>Burgos Leandro</td>
                            <td>Esclavo</td>
                            <td><button style="background: #3d5afe" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">person</i>
                                </button></td>

                            <td>850</td>
                            <td>12</td>
                            <td><button style="background: #76ff03" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">trending_up</i>
                                </button></td>

                            <td>34</td>
                            <td>54</td>
                            <td><button style="background: #7b1fa2" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">trending_down</i>
                                </button></td>

                            <td>54</td>
                            <td><button style="background: #f4511e"  class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">attach_money</i>
                                </button></td>
                            <td>5400</td>    
                        </tr>
                    </tbody>

                </table>    
            </center>
        </div>
    </body>
</html>
