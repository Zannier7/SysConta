<%-- 
    Document   : configuraciones
    Created on : 23-jun-2017, 1:01:48
    Author     : danil
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuraciones</title>
        <script src="./resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link href="./resources/Material+Icons.css" rel="stylesheet" type="text/css"/>
        <script src="./resources/material.js" type="text/javascript"></script>
        <link href="./resources/material.min.css" rel="stylesheet" type="text/css"/>
        <script src="./resources/material.min.js" type="text/javascript"></script>
        <link href="./resources/style.css" rel="stylesheet" type="text/css"/>
        <script src="./resources/script.js" type="text/javascript"></script>

    </head>
    <body>
        <div>

            <div class="mdl-grid" style="margin: 20px; text-align: center;">
                <style>
                    .demo-card-square.mdl-card {
                        max-width: 304px;
                        height: 560px;
                    }
                    .demo-card-square > .mdl-card__title {
                        color: #fff;
                        background:
                            url('.png') bottom right 5% no-repeat #1976d2;
                    }
                </style>

                <div class="demo-card-square mdl-card mdl-shadow--8dp mdl-cell mdl-cell--3-col">
                    <div class="mdl-card__title mdl-card--expand">
                        <i style="color: white; font-size: 100px" class="large material-icons">settings</i>
                        <h2 class="mdl-card__title-text" style="text-align: center;">Ajustes de Planilla</h2>

                    </div>
                    <div class="mdl-card__supporting-text">
                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                            <thead>
                                <tr>
                                    <th class="mdl-data-table__cell--non-numeric">DATOS UIT<th>PORCENTAJE</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-label="Material" class="mdl-data-table__cell--non-numeric">Hasta 5 UIT</td>
                                    <td data-label="Quantity">8%</td>

                                </tr>
                                <tr>
                                    <td data-label="Material" class="mdl-data-table__cell--non-numeric">De 5 a 20 UIT</td>
                                    <td data-label="Quantity">14%</td>

                                </tr>
                                <tr>
                                    <td data-label="Material" class="mdl-data-table__cell--non-numeric">De 20 a 35 UIT</td>
                                    <td data-label="Quantity"> 17%</td>

                                </tr>
                                <tr>
                                    <td data-label="Material" class="mdl-data-table__cell--non-numeric">De 35 a 45 UIT</td>
                                    <td data-label="Quantity">20%</td>

                                </tr>
                                <tr>
                                    <td data-label="Material" class="mdl-data-table__cell--non-numeric">Más de 45 UIT</td>
                                    <td data-label="Quantity">30%</td>

                                </tr>
                            </tbody>
                        </table>
                        <form action="uit" method="post">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input type="hidden" value="1" name="uit">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                <label class="mdl-textfield__label" for="sample4">Ingresar nueva UIT.</label>
                                <span class="mdl-textfield__error">Se requiere de nùmeros!</span>
                            </div>
                            <div class="mdl-card__actions mdl-card--border">
                                <center>
                                    <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #1976d2">
                                        MODIFICAR UIT
                                    </button>
                                </center>
                            </div>
                        </form>

                    </div>


                </div>

                <div class="demo-card-square mdl-card mdl-shadow--8dp mdl-cell mdl-cell--3-col">
                    <div class="mdl-card__title mdl-card--expand"  style="max-width: 100%; max-height: 130px;">
                        <i style="color: white; font-size: 100px" class="large material-icons">people</i>
                        <h2 class="mdl-card__title-text" style="text-align: center;">Opciones para el trabajador </h2>

                    </div>
                    <br>
                    <div>
                        <main class="mdl-layout__content">
                            <div class="mdl-grid">
                                <div class="mdl-card mdl-cell mdl-cell--5-col mdl-cell--4-col-tablet mdl-shadow--dp">

                                    <div class="mdl-card__title">
                                        <h1 class="mdl-card__title-text" style="color: #1976d2;">AFP</h1>
                                    </div>
                                    <form action="config" method="post">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="sample3">
                                            <label class="mdl-textfield__label" for="sample3">Nombre de AFP</label>
                                        </div>

                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                            <label class="mdl-textfield__label" for="sample4">Tarifa de AFP.</label>
                                            <span class="mdl-textfield__error">Se requiere de nùmeros!</span>
                                        </div>
                                        <div>
                                            <center>
                                                <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #1976d2">
                                                    GUARDAR
                                                </button>
                                            </center>
                                        </div>
                                        <div class="mdl-card__actions mdl-card--border">
                                            <center>
                                                <a id="mdl-custom-btn" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                                    ver.afp
                                                </a>
                                            </center>
                                        </div>
                                    </form>
                                </div>

                                <div class="mdl-card mdl-cell mdl-cell--5-col mdl-cell--4-col-tablet mdl-shadow--dp">
                                    <div class="mdl-card__title">
                                        <h1 class="mdl-card__title-text" style=" color: #1976d2;">ONP</h1>
                                    </div>

                                    <form action="config" method="post">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="sample3">
                                            <label class="mdl-textfield__label" for="sample3">Nombre de ONP</label>
                                        </div>

                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                            <label class="mdl-textfield__label" for="sample4">Tarifa de ONP.</label>
                                            <span class="mdl-textfield__error">Se requiere de nùmeros!</span>
                                        </div>
                                        <div>
                                            <center>
                                                <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #1976d2">
                                                    GUARDAR
                                                </button>
                                            </center>
                                        </div>
                                        <div class="mdl-card__actions mdl-card--border">
                                            <center>
                                                <a id="mdl-custom-btn_1" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                                    ver.ONP
                                                </a>
                                            </center>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </main>
                    </div>

                </div>
                <div class="demo-card-square mdl-card mdl-shadow--8dp mdl-cell mdl-cell--3-col">
                    <div class="mdl-card__title md-card--expand">
                        <i style="color: white; font-size: 100px" class="large material-icons">work</i>
                        <h2 class="mdl-card__title-text" style="text-align: center;">Nuevos puestos de trabajo</h2>

                    </div>

                    <h5 class="mdl-dialog__title" style=" color: #1976d2">Crear Puesto de Trabajo</h5>
                    <div class="mdl-dialog__content">
                        <form>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" id="iname">
                                <label class="mdl-textfield__label" for="iname">Nombre del puesto</label>
                            </div>
                            <div>
                                <center>
                                    <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #1976d2">
                                        GUARDAR
                                    </button>
                                </center>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="demo-card-square mdl-card mdl-shadow--8dp mdl-cell mdl-cell--3-col">
                    <div class="mdl-card__title md-card--expand">
                        <i style="color: white; font-size: 100px" class="large material-icons">gavel</i>
                        <h2 class="mdl-card__title-text" style="text-align: center;">Configuraciòn de polìticas</h2>

                    </div>
                    <div>
                        <h3 class="mdl-dialog__title" style=" color: #1976d2">Nueva Politica de pago</h3>
                        <div class="mdl-dialog__content">
                            <form>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                    <label class="mdl-textfield__label" for="sample4">Ingresar nuevo monto.</label>
                                    <span class="mdl-textfield__error">Se requiere de nùmeros!</span>
                                </div>

                            </form>
                        </div>
                        <div>
                            <center>
                                <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #1976d2">
                                    GUARDAR
                                </button>
                            </center>
                        </div>


                    </div>

                </div>
            </div>

            <style>  .modal {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.25);
                }

                .modal-content {
                    margin: 10% auto;
                    border-radius:5px
                }

                .mdl-card__actions { background-color: rgba(222, 222, 222, 0.25); }
            </style>
            <style>  .modal1 {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.25);
                }

                .modal-content {
                    margin: 10% auto;
                    border-radius:5px
                }

                .mdl-card__actions { background-color: rgba(222, 222, 222, 0.25); }
            </style>

            <div id="mdl-custom-modal" class="modal">
                <div class="modal-content mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <form action="#" st>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="^\s*[0-9a-zA-Z][0-9a-zA-Z ]*$" id="mdl-name">
                                <label class="mdl-textfield__label" for="mdl-name">Name...</label>
                                <span class="mdl-textfield__error">The field can not be empty!</span>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="^[\s()+-]*([0-9][\s()+-]*){6,20}$" id="mdl-phone">
                                <label class="mdl-textfield__label" for="mdl-phone">Phone...</label>
                                <span class="mdl-textfield__error">Input is not a number!</span>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern='^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' id="mdl-email">
                                <label class="mdl-textfield__label" for="mdl-email">E-mail...</label>
                                <span class="mdl-textfield__error">E-mail is not valid!</span>
                            </div>
                        </form>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            Submit
                        </a>
                    </div>
                    <div class="mdl-card__menu">
                        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect mdl-custom-close">
                            <span class="material-icons">close</span>
                        </button>
                    </div>

                </div>
            </div>
            <div id="mdl-custom-modal" class="modal">
                <div class="modal-content mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <form action="#" st>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="^\s*[0-9a-zA-Z][0-9a-zA-Z ]*$" id="mdl-name">
                                <label class="mdl-textfield__label" for="mdl-name">Ver Datos </label>
                                <span class="mdl-textfield__error">The field can not be empty!</span>
                            </div>
                           
                        </form>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            Submit
                        </a>
                    </div>
                    <div class="mdl-card__menu">
                        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect mdl-custom-close">
                            <span class="material-icons">close</span>
                        </button>
                    </div>

                </div>
            </div>
            <script>
                var modal = document.getElementById('mdl-custom-modal'),
                        btn = document.getElementById("mdl-custom-btn"),
                        btn1 = document.getElementById("mdl-custom-btn"),
                        close = document.getElementsByClassName("mdl-custom-close")[0];

                btn.onclick = function () {
                    'use strict';
                    modal.style.display = "block";
                }

                close.onclick = function () {
                    'use strict';
                    modal.style.display = "none";
                }

                /* Use if you whant to close modal when click outside of modal window */
                window.onclick = function (event) {
                    'use strict';

                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            </script>
            <script>
                var modal1 = document.getElementById('mdl-custom-modal'),
                        btn = document.getElementById("mdl-custom-btn"),
                        btn1 = document.getElementById("mdl-custom-btn_1"),
                        close = document.getElementsByClassName("mdl-custom-close")[0];

                btn.onclick = function () {
                    'use strict';
                    modal1.style.display = "block";
                }

                close.onclick = function () {
                    'use strict';
                    modal1.style.display = "none";
                }

                /* Use if you whant to close modal when click outside of modal window */
                window.onclick = function (event) {
                    'use strict';

                    if (event.target == modal1) {
                        modal1.style.display = "none";
                    }
                }
            </script>
            <%
                String cod=request.getParameter("iut");
                Connection cnx=null;
                ResultSet rs=null;
                Statement sta=null;
                Class.forName("com.mysql.jdbc.Driver");
               
                
            %>


    </body>
</html>
