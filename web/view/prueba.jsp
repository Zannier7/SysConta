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
        <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>


    </head>
    <body>

    <center>

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
                for (var i = 0; i < lista.length; i++) {
                    m += '<tr>';
                    m += '<td>' + lista[i].idplanilla + '</td>';
                    m += '<td>' + lista[i].fecha + '</td>';
                    m += '<td>' + lista[i].fecha + '</td>';
                    m += '<td>' + lista[i].fecha + '</td>';
                    m += '<td>' + lista[i].fecha + '</td>';
                    m += '<td>' + lista[i].fecha + '</td>';
                    m += '</tr>';
                }
                $("#contenido").empty();
                $("#contenido").append(createTable());
                $("#hola").empty();
                $("#hola").append(m);
            }


            function createTable() {
                var s = '<table>';
                s += '<thead>';
                s += '<tr>';
                s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
                s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
                s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
                s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
                s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
                s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
                s += '</tr>';

                s += '</thead>';
                s += '<tbody id="hola">';
                s += '</tbody>';
                s += '</table>';
                return s;
            }




        </script>
</body>
</html>
