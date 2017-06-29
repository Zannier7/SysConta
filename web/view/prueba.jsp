<%-- 
    Document   : prueba
    Created on : 28/06/2017, 04:08:53 PM
    Author     : UPEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Diario</title>
        <link rel="shortcut icon" type="image/ico" href="../resources/money.ico" />
        <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>



    </head>
    <body>

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
                    <th style="font-size: 15px; text-align: center">1</th>
                    <th style="font-size: 15px; text-align: center">2015202635214</th>
                    <th style="font-size: 15px; text-align: center">Los Arnolds S.A</th>
                </tr>
            </tbody>

        </table>
        <div id="contenido"></div>
    </center>


    <script type="text/javascript">
        $(document).ready(function () {
            validar();

        });

        function validar() {
            var url = '../prueba';
            var data = 'opc=1';
            $.post(url, data, function (objJson) {
                var a = objJson.lista;
                if (a.length > 0) {
                    listar(a);

                }
            });

        }
        function listar(lista) {
            var m = '';
            var s='';
        
             
            for (var i = 0; i < lista.length; i++) {
                          
                m += '<tr>';
                m += '<td style="text-align: center">' + lista[i].idplanilla + '</td>';
                m += '<td style="text-align: center">' + lista[i].fecha + '</td>';
                m += '<td style="text-align: center">' + lista[i].ntotal + '</td>';
                m += '<td style="text-align: center">' + lista[i].codigo + '</td>';
                m += '<td style="text-align: center">' + lista[i].denominacion + '</td>';
                m += '<td style="text-align: center">' + lista[i].monto + '</td>';
                m += '<td style="text-align: center">' + lista[i].movimiento + '</td>';
                m += '</tr>';
            }
            $("#contenido").empty();
            $("#contenido").append(createTable());
            $("#hola").empty();
            $("#hola").append(m);
            
        }


        function createTable() {
            var s = ' <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" cellspacing="0" >';
            s += '<thead>';
            s += '<tr>';
            s += '<th><center>Código Único de la Operación</center></th>';
            s += '<th style="color: #558b2f"><center>Fecha de la Operación</center></th>';
            s += '<th style="color: #e65100"><center>Descripción de la Operación</center></th>';
            s += '<th style="color: #e65100">Código</th>';
            s += '<th style="color: #01579b; text-align: center;">Denominación</th>';
            s += '<th style="color: #d50000">Debe</th>';
            s += '<th style="color: #d50000">Haber</th>';
            s += '</tr>';
            s += '</thead>';
            s += ' <tbody class="tbodys" id="hola">';
            s += '</tbody>';
            s += '</table>';
            return s;
        }




    </script>
</body>
</html>
