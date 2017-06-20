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
        <script src="../resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </head>
    <body>
        <div class="mdl-grid">
            <div id="config" class="mdl-card mdl-shadow--8dp mdl-cell mdl-cell--4-col mdl-cell--4-offset mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="max-width: 256px;cursor: pointer">
                <div class="mdl-card__title" style="background: #7986CB;text-align: center;display: block">
                        <i style="color: white; font-size: 140px" class="large material-icons">settings</i>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a href="#" class="mdl-button mdl-button--colored mdl-js-button" style="display:block">Configuraciones</a>
                </div>
            </div>
            <div id="planilla" class="mdl-card mdl-shadow--8dp mdl-cell mdl-cell--4-col mdl-cell--middle mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="max-width: 256px;cursor: pointer">
                <div class="mdl-card__title" style="background: #7986CB;text-align: center;display: block">
                    <i style="color: white; font-size: 140px" class="large material-icons">people</i>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a href="#" class="mdl-button mdl-button--colored mdl-js-button" style="display:block">Planilla</a>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $("#planilla").click(function(){
                    location.href="../index.jsp";
                });
                $("#config").click(function(){
                    location.href="settings.jsp";
                });
            });
        </script>
    </body>
</html>
