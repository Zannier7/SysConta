<%-- 
    Document   : main
    Created on : 14/06/2017, 09:42:39 AM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link href="resources/Material+Icons.css" rel="stylesheet" type="text/css"/>
        <script src="resources/material.js" type="text/javascript"></script>
        <link href="resources/material.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/material.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="mdl-grid">
            <div id="config" class="mdl-card mdl-shadow--8dp mdl-cell mdl-cell--4-col mdl-cell--1-offset mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="max-width: 256px;cursor: pointer">
                <div class="mdl-card__title" style="background: #512da8;text-align: center;display: block">
                    <i style="color: white; font-size: 140px" class="large material-icons">settings</i>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a href="#" class="mdl-button mdl-button--colored mdl-js-button" style="display:block">Configuraciones</a>
                </div>
            </div>
            <div onclick="redirect('main?opc=2')" id="planilla" class="mdl-card mdl-shadow--8dp mdl-cell mdl-cell--4-col mdl-cell--middle mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="max-width: 256px;cursor: pointer">
                <div class="mdl-card__title" style="background: #140078;text-align: center;display: block">
                    <i style="color: white; font-size: 140px" class="large material-icons">people</i>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a href="#" class="mdl-button mdl-button--colored mdl-js-button" style="display:block">Planilla</a>
                </div>
            </div>
            <div id="cardex" class="mdl-card mdl-shadow--8dp mdl-cell mdl-cell--4-col mdl-cell--middle mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="max-width: 256px;cursor: pointer">
                <div class="mdl-card__title" style="background: #8559da;text-align: center;display: block">
                    <i style="color: white; font-size: 140px" class="large material-icons">playlist_add_check</i>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a href="#" class="mdl-button mdl-button--colored mdl-js-button" style="display:block">Cárdex</a>
                </div>
            </div>
            <div id="ldiario" class="mdl-card mdl-shadow--8dp mdl-cell mdl-cell--4-col mdl-cell--middle mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="max-width: 256px;cursor: pointer">
                <div class="mdl-card__title" style="background: #5e35b1;text-align: center;display: block">
                    <i style="color: white; font-size: 140px" class="large material-icons">book</i>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a href="#" class="mdl-button mdl-button--colored mdl-js-button" style="display:block">Libro Diario</a>
                </div>
            </div>
        </div>
        <script>
            function redirect(url) {
                location.href = url;
            }
        </script>
    </body>
</html>
