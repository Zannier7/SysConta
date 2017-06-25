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
        <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link href="../resources/Material+Icons.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/material.js" type="text/javascript"></script>
        <link href="../resources/material.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/material.min.js" type="text/javascript"></script>
    </head>
    <body>
    <center><div id="noData" class="maia-col-4 card services-track mdl-card mdl-shadow--2dp">
            <div class="image mdl-card__title">
            </div>
            <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                <h3 class="mdl-card__title-text subhead mdl-typography--font-regular">
                    No hay Trabajadores en Planilla
                </h3>
                <p>
                    Aún no se ha realizado la contratación de trabajadores. Al realizarla podrá ver 
                    la lista de los contratados en esta sección
                </p>
            </div>
        </div></center>
    <div id="yesData">
        <center>
            <h1>Planilla</h1>
            <div id="contT"></div>
        </center>
    </div>
    <dialog class="mdl-dialog mdl-cell--6-col">
        <h4 class="mdl-dialog__title" id="titleM"></h4>
        <div class="mdl-dialog__content" id="contenidoM"> 
        </div>
        <div class="mdl-dialog__actions">
            <button type="button" class="mdl-button close">Cerrar</button>
        </div>
    </dialog>
    <script>

        var dialog = document.querySelector('dialog');

        dialog.querySelector('.close').addEventListener('click', function () {
            dialog.close();
        });

        $(document).ready(function () {
            $("#noData").hide();
            $("#yesData").hide();
            validar();
        });

        function validar() {
            var url = '../payroll';
            var data = 'opc=1';
            $.post(url, data, function (objJson) {
                var a = objJson.lista;
                if (a.length <= 0) {
                    $("#noData").show();
                    $("#yesData").hide();
                } else {
                    listar(a);
                    $("#yesData").show();
                    $("#noData").hide();
                }
            });
        }

        function listar(lista) {
            var m = '';
            for (var i = 0; i < lista.length; i++) {
                m += '<tr>';
                m += '<td>Burgos Leandro</td>';
                m += '<td>Esclavo</td>';
                m += '<td><button type="button" onclick="mod(1)" style="background: #3d5afe" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
                m += '<i class="material-icons">person</i>';
                m += '</button></td>';
                m += '<td>850</td>';
                m += '<td>12</td>';
                m += '<td><button type="button" onclick="mod(2)" style="background: #76ff03" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
                m += '<i class="material-icons">trending_up</i>';
                m += '</button></td>';
                m += '<td>34</td>';
                m += '<td>54</td>';
                m += '<td><button type="button" onclick="mod(3)" id="btn3" style="background: #7b1fa2" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
                m += '<i class="material-icons">trending_down</i>';
                m += '</button></td>';
                m += '<td>54</td>';
                m += '<td>54</td>';
                m += '<td>5400</td>';
                m += '</tr>';
            }
            $("#contT").empty();
            $("#contT").append(createTable());
            $("#CBody").empty();
            $("#CBody").append(m);
        }

        function mod(tipo) {
            //EDITAR DEACUERDO AL ID
            if (tipo == 1) {
                $("#titleM").empty();
                $("#titleM").append("Datos del Trabajador     <i class='material-icons'>info</i>");
                var a = createContentWorker();
                $("#contenidoM").empty();
                $("#contenidoM").append(a);
            }
            if (tipo == 2) {
                $("#titleM").empty();
                $("#titleM").append("Remuneraciones");
                var s = createContentRemuneration();
                $("#contenidoM").empty();
                $("#contenidoM").append(s);
            }
            if (tipo == 3) {
                $("#titleM").empty();
                $("#titleM").append("Descuentos");
                var s = createContentDiscount();
                $("#contenidoM").empty();
                $("#contenidoM").append(s);
            }
            dialog.showModal();
        }

        function createContentDiscount() {
            var s = '<ul class="demo-list-two mdl-list">';
            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">info</i>';
            s += '<span>AFP</span>';
            s += '<span class="mdl-list__item-sub-title">Integra (0.12)</span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">256.44</a>';
            s += '</span>';
            s += '</li>';

            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">gavel</i>';
            s += '<span>Impuesto a la Renta</span>';
            s += '<span class="mdl-list__item-sub-title">Integra (0.12)</span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">126.00</a>';
            s += '</span>';
            s += '</li>';

            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">remove_circle</i>';
            s += '<span>Otros</span>';
            s += '<span class="mdl-list__item-sub-title"></span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">256.44</a>';
            s += '</span>';
            s += '</li>';
            s += '</ul>';
            return s;
        }

        function createContentRemuneration() {
            var s = '<ul class="demo-list-two mdl-list">';
            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">attach_money</i>';
            s += '<span>Sueldo Básico</span>';
            s += '<span class="mdl-list__item-sub-title">900.00</span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">1000.00</a>';
            s += '</span>';
            s += '</li>';

            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">child_friendly</i>';
            s += '<span>Asignación Familiar</span>';
            s += '<span class="mdl-list__item-sub-title">2 hijos</span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">126.00</a>';
            s += '</span>';
            s += '</li>';

            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">check_circle</i>';
            s += '<span>Beneficios</span>';
            s += '<span class="mdl-list__item-sub-title"></span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">256.44</a>';
            s += '</span>';
            s += '</li>';

            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">add_circle</i>';
            s += '<span>Comisión</span>';
            s += '<span class="mdl-list__item-sub-title"></span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">256.44</a>';
            s += '</span>';
            s += '</li>';

            s += '<li class="mdl-list__item mdl-list__item--two-line">';
            s += '<span class="mdl-list__item-primary-content">';
            s += '<i class="material-icons mdl-list__item-avatar">alarm_add</i>';
            s += '<span>Horas Extra</span>';
            s += '<span class="mdl-list__item-sub-title">6 horas</span>';
            s += '</span>';
            s += '<span class="mdl-list__item-secondary-content">';
            s += '<a class="mdl-list__item-secondary-action">256.44</a>';
            s += '</span>';
            s += '</li>';
            s += '</ul>';
            return s;
        }

        function createContentWorker() {
            //Envio post
            /*
             var name='';
             var puesto='';
             var diasL='';
             var horasL='';
             var horasE='';
             var url='';
             var data='';
             $.post(url,data,function(pack){
             
             });
             */
            var name = 'Arnold Danilo Morales Gomez';
            var puesto = 'Esclavo';
            var diasL = '5 Días';
            var horasL = '8 Horas';
            var horasE = '6 horas';
            var b = '<div>';
            b += '<ul class="demo-list-two mdl-list">';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">person</i>';
            b += '<span>' + name + '</span>';
            b += '<span class="mdl-list__item-sub-title">Nombres y Apellidos</span>';
            b += '</span>';
            b += '</li>';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">work</i>';
            b += '<span>' + puesto + '</span>';
            b += '<span class="mdl-list__item-sub-title">Puesto de Trabajo</span>';
            b += '</span>';
            b += '</li>';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">today</i>';
            b += '<span>' + diasL + '</span>';
            b += '<span class="mdl-list__item-sub-title">Días Laborables</span>';
            b += '</span>';
            b += '</li>';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">view_module</i>';
            b += '<span>' + horasL + '</span>';
            b += '<span class="mdl-list__item-sub-title">Horas Laborables</span>';
            b += '</span>';
            b += '</li>';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">add</i>';
            b += '<span>' + horasE + '</span>';
            b += '<span class="mdl-list__item-sub-title">Horas Extra</span>';
            b += '</span>';
            b += '</li>';
            b += '</ul>';
            b += '</div>';
            return b;
        }

        function createTable() {
            var s = '<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="contTable" cellspacing="0" >';
            s += '<thead>';
            s += '<tr>';
            s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
            s += '<th colspan="3" style="color: #558b2f"><center>Remuneraciones</center></th>';
            s += '<th colspan="3" style="color: #e65100"><center>Descuentos</center></th>';
            s += '<th colspan="2" style="color: #01579b"><center>Aportes</center></th>';
            s += '<th colspan="1" style="color: #d50000"><center>Monto a Pagar</center></th>';
            s += '</tr>';
            s += '<tr>';
            s += '<th class="tra">Apellidos y Nombres</th>';
            s += '<th class="tra">Ocupación</th>';
            s += '<th></th>';
            s += '<th style="color: #558b2f">Sueldo Básico</th>';
            s += '<th style="color: #558b2f">Total</th>';
            s += '<th></th>';
            s += '<th style="color: #e65100">Imp. Renta</th>';
            s += '<th style="color: #e65100">Total</th>';
            s += '<th></th>';
            s += '<th style="color: #01579b">EsSalud</th>';
            s += '<th style="color: #01579b">Total</th>';
            s += '<th style="color: #d50000">Total</th>';
            s += '</tr>';
            s += '</thead>';
            s += '<tbody id="CBody">';
            s += '</tbody>';
            s += '</table>';
            return s;
        }

    </script>



</body>
</html>
