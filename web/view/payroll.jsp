<%-- 
    Document   : payroll
    Created on : 13/06/2017, 12:04:26 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <h3>Planilla</h3>
            <div id="contT"></div>
        </center>
        <button onclick="mod(4,0)" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--primary" style="color: white;float: right;margin-right: 7%;">
            Totales
        </button>
    </div>
    <dialog class="mdl-dialog mdl-cell--6-col">
        <h4 class="mdl-dialog__title" id="titleM"></h4>
        <div class="mdl-dialog__content" id="contenidoM"> 
        </div>
        <div class="mdl-dialog__actions">
            <button style="color: white" type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent close">Cerrar</button>
        </div>

    </dialog>
    <script src="../resources/conPayroll.js" type="text/javascript"></script>
</body>
</html>
