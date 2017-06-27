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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link rel="stylesheet" href="https://cdn.rawgit.com/CreativeIT/getmdl-select/master/getmdl-select.min.css">
        <script defer src="https://cdn.rawgit.com/CreativeIT/getmdl-select/master/getmdl-select.min.js"></script>
        <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>
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
                            <!-- Select with arrow-->
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height">
                                <input class="mdl-textfield__input" name="cargo" type="text" id="cargo" value="Seleccionar" readonly tabIndex="-1">
                                <label for="cargo">
                                    <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
                                </label>
                                <label for="cargo" class="mdl-textfield__label">Puesto de Trabajo</label>
                                <ul for="cargo" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                    <li class="mdl-menu__item" data-val="Esclavo">Esclavo</li>
                                    <li class="mdl-menu__item" data-val="Barrendero">Barrendero</li>
                                    <li class="mdl-menu__item" data-val="Garitero">Garitero</li>
                                </ul>
                            </div>
                        </div>
                        <div style="width: 33%;float: left">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="\d{1,2}/\d{1,2}/\d{4}" name="fini" id="fini">
                                <label class="mdl-textfield__label" for="fini">Fecha de Inicio</label>
                                <span class="mdl-textfield__error">¡No es un fecha!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="ffin" id="ffin">
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
        $(document).ready(function(){
            $("#env").click(function(){
            var nombre = $("#nombres").val();
            var ap = $("#apellidos").val();
            var dni = $("#dni").val();
            var hrlab = $("#hrlab").val();
            var fini = $("#fini").val();
            var ffin = $("#ffin").val();
            var cargo = $("#cargo").val();
            var dlab = $("#dlab").val();
            var sbase = $("#sbase").val();
            var asigf=$("input[name:'asignf']").prop("checked");
            if (nombre != "" && ap != "" && dni != "" && hrlab != "" && fini != "" && ffin == cargo && dlab != "" && asigf != "" && sbase != "") {
                var url = "reg?opc=2&tipe=registrar";
                var data = "nombre=" + nombre;
                data += "&apallidos=" + ap;
                data += "&dni=" + dni;
                data += "&hrlab=" + hrlab;
                data += "&fini=" + fini;
                data += "&ffin=" + ffin;
                data += "&cargo=" + cargo;
                data += "&dlab=" + dlab;
                data += "&sbase=" + sbase;
                data += "&asignf=" + asigf;
                $.post(url, data, function (pack) {
                    if (pack.rpta) {
                        new PNotify({
                            title: 'Correcto',
                            text: 'El trabajador ha sido contratado',
                            type: 'primary'
                        });
                        clear();
                    }
                });

            } else {
                new PNotify({
                            title: 'Correcto',
                            text: 'Faltan ingresar algunos datos necesarios',
                            type: 'warning'
                        });
                        clear();
            }
            });
        });
    </script>
</body>
</html>
