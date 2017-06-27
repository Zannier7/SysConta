<%-- 
    Document   : register
    Created on : 13/06/2017, 05:16:51 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link href="../resources/material.min.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/Material+Icons.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/material.js" type="text/javascript"></script>
        <link href="../resources/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="../resources/select2.min.js" type="text/javascript"></script>
        <link href="../resources/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    </head>
    <body>
    <center>
        <div>
            <h3>Contrato</h3>
            <form action="#">
                <div style="width: 80%;">
                    <div style="width: 100%;height: 150px;"><!--DATOS PERSONALES-->
                        <h5 style="text-align: left">Datos personales</h5>
                        <div style="width: 33%;float: left">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" name="nombre" id="nombre">
                                <label class="mdl-textfield__label" for="nombre">Nombre(s)</label>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" length="8" type="text" name="dni" id="dni" pattern="-?[0-9]*(\.[0-9]+)?">
                                <label class="mdl-textfield__label" for="dni">DNI</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" name="apellidos" id="apellidos">
                                <label class="mdl-textfield__label" for="apellidos">Apellidos</label>
                            </div><br/>
                        </div>

                    </div>
                    <div style="width: 100%;height: 150px;d"><!--DATOS DE TRABAJO-->
                        <h5 style="text-align: left">Datos de trabajo</h5>
                        <div style="width: 33%;float: left">
                            <select name="cargo" id="listcargo" style="width: 95%;">
                            </select>
                        </div>
                        <div style="width: 33%;float: left">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="\d{4}-\d{1,2}-\d{1,2}" name="fini" id="fini">
                                <label class="mdl-textfield__label" for="fini">Fecha de Inicio</label>
                                <span class="mdl-textfield__error">¡No es un fecha!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="\d{4}-\d{1,2}-\d{1,2}" name="ffin" id="ffin">
                                <label class="mdl-textfield__label" for="ffin">Fecha Fin</label>
                                <span class="mdl-textfield__error">¡No es un fecha!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="hrlab" id="hrlab">
                                <label class="mdl-textfield__label" for="hrlab">Horas Laborales</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="dlab" id="dlab">
                                <label class="mdl-textfield__label" for="dlab">Días Laborales</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                    </div>
                    <div style="width: 100%;height: 150px;d"><!--DATOS Financieros-->
                        <h5 style="text-align: left">Datos Financieros</h5>
                        <div style="width: 33%;float: right">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="asignf">
                                <input type="checkbox" id="asignf" name="asignf" class="mdl-checkbox__input">
                                <span class="mdl-checkbox__label">Asignación Familiar</span>
                            </label>
                        </div>
                        <div style="width: 33%;float: right">

                        </div>
                        <div style="width: 33%;float: left">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sbase" name="sbase">
                                <label class="mdl-textfield__label" for="sbase">Sueldo Base</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                    </div>
                    <div style="width: 100%;height: 150px;d">
                        <input type="button" id="env" class="mdl-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="Confirmar">
                    </div>
                </div>
            </form>
        </div>
    </center>
    <script>
        $(document).ready(function () {
            $.post("../reg?opc=2&tipe=getcargo", function (ObjJson) {
                if (ObjJson != null) {
                    var lista = ObjJson.lista;
                    for (var i = 0; i < lista.length; i++) {
                        $("#listcargo").append('<option value="' + lista[i].id + '">' + lista[i].cargo + '</option>');
                    }
                }
            });
            $("#listcargo").select2();
            $("#env").click(function () {
                var nombre = $("#nombre").val();
                var ap = $("#apellidos").val();
                var dni = $("#dni").val();
                var hrlab = $("#hrlab").val();
                var fini = $("#fini").val();
                var ffin = $("#ffin").val();
                var cargo = $("#listcargo").val();
                var dlab = $("#dlab").val();
                var sbase = $("#sbase").val();
                var asigf;
                if ($("#asignf").is(":checked")) {
                    asigf = 1;
                } else {
                    asigf = 0;
                }
                if (nombre != "" && ap != "" && dni != "" && hrlab != "" && fini != "" && ffin != "" && cargo != "" && dlab != "" && asigf != "" && sbase != "") {
                    var url = "../reg?opc=2&tipe=registrar";
                    var data = "nombre=" + nombre;
                    data += "&apellidos=" + ap;
                    data += "&dni=" + dni;
                    data += "&hrlab=" + hrlab;
                    data += "&fini=" + fini;
                    data += "&ffin=" + ffin;
                    data += "&idcargo=" + cargo;
                    data += "&dlab=" + dlab;
                    data += "&sbase=" + sbase;
                    data += "&asignf=" + asigf;
                    $.post(url, data, function (pack) {
                        if (pack.rpta != 0) {
                            new PNotify({
                                title: 'Correcto',
                                text: 'El trabajador ha sido contratado',
                                type: 'success'
                            });
                            window.top.location.href='../main?opc=2';
                        }
                    });

                } else {
                    new PNotify({
                        title: 'Atención',
                        text: 'Faltan ingresar algunos datos necesarios',
                        type: 'error'
                    });
                }
            });
        });
    </script>
</body>
</html>
