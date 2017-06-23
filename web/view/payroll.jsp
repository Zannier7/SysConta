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
                            <td><button type="button" onclick="mod('datostr')" style="background: #3d5afe" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">person</i>
                                </button></td>

                            <td>850</td>
                            <td>12</td>
                            <td><button type="button" onclick="mod('datosrm')" style="background: #76ff03" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">trending_up</i>
                                </button></td>

                            <td>34</td>
                            <td>54</td>
                            <td><button type="button" onclick="mod('datosde')" id="btn3" style="background: #7b1fa2" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">trending_down</i>
                                </button></td>

                            <td>54</td>
                            <td><button type="button" onclick="mod('datosto')" id="btn4" style="background: #f4511e"  class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
                                    <i class="material-icons">attach_money</i>
                                </button></td>
                            <td>5400</td>    
                        </tr>
                    </tbody>

                </table>    
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
        function mod(tipo) {
            //EDITAR DEACUERDO AL ID
            if (tipo == 'datostr') {
                $("#titleM").empty();
                $("#titleM").append("Datos del Trabajador");
                var a = createContent();
                $("#contenidoM").empty();
                $("#contenidoM").append(a);
            }
            if (tipo == 'datosrm') {
                $("#titleM").empty();
                $("#titleM").append("Remuneraciones");
                $("#contenidoM").empty();
                $("#contenidoM").append('<h1>ARNULFO</h1>');
            }
            if (tipo == 'datosde') {
                $("#titleM").empty();
                $("#titleM").append("Descuentos");
            }
            if (tipo == 'datosto') {
                $("#titleM").empty();
                $("#titleM").append("Total");
            }
            dialog.showModal();
        }

        function createContent() {
            var b = '<div>';
            b += '<ul class="demo-list-two mdl-list">';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">person</i>';
            b += '<span>Arnold Danilo Morales Gomez</span>';
            b += '<span class="mdl-list__item-sub-title">Nombres y Aoellidos</span>';
            b += '</span>';
            b += '<span class="mdl-list__item-secondary-content">';
            b += '<span class="mdl-list__item-secondary-info">Actor</span>';
            b += '<a class="mdl-list__item-secondary-action" href="#"><i class="material-icons">star</i></a>';
            b += '</span>';
            b += '</li>';
            b += '<li class="mdl-list__item mdl-list__item--two-line">';
            b += '<span class="mdl-list__item-primary-content">';
            b += '<i class="material-icons mdl-list__item-avatar">person</i>';
            b += '<span>Aaron Paul</span>';
            b += '<span class="mdl-list__item-sub-title">62 Episodes</span>';
            b += '</span>';
            b += '<span class="mdl-list__item-secondary-content">';
            b += '<a class="mdl-list__item-secondary-action" href="#"><i class="material-icons">star</i></a>';
            b += '</span>';
            b += '</li>';
            b += '</ul>';
            b += '</div>';
            return b;
        }

    </script>



</body>
</html>
