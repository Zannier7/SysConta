<%-- 
    Document   : index
    Created on : 13/06/2017, 11:57:36 AM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" >
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </head>
    <body>

        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header">
                <!-- Tabs -->
                <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
                    <a href="view/payroll.jsp" target="frame" class="mdl-layout__tab is-active">Planilla</a>
                    <a href="view/settings.jsp" target="frame" class="mdl-layout__tab">Configuraciones</a>
                    <a href="view/register.jsp" target="frame" class="mdl-layout__tab">Registro de Trabajadores</a>
                </div>
            </header>
            <div class="mdl-layout__drawer">
                <span class="mdl-layout-title">Title</span>
                <nav class="mdl-navigation">
                    <a class="mdl-navigation__link" href="">Link</a>
                    <a class="mdl-navigation__link" href="">Link</a>
                    <a class="mdl-navigation__link" href="">Link</a>
                    <a class="mdl-navigation__link" href="">Link</a>
                </nav>
            </div>
            <main class="mdl-layout__content">
                <iframe 
                    name="frame" id="idframe" onload="loadFrame(this.contentWindow.location);"
                    style="width: 100%;height: 660px;overflow-y: hidden;border: none">
            </iframe>
            </main>
        </div>
    </body>
</html>