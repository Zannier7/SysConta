<%-- 
    Document   : index
    Created on : 13/06/2017, 11:57:36 AM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" style="overflow-y: hidden">
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </head>
    <body>

        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header">
                <!-- Tabs -->
                <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
<<<<<<< HEAD
                    <a href="view/payroll.jsp" target="frame" class="mdl-layout__tab is-active">Planilla</a>
                    <a href="view/settings.jsp" target="frame" class="mdl-layout__tab">Configuraciones</a>
                    <a href="view/contract.jsp" target="frame" class="mdl-layout__tab">Registro de Trabajadores</a>
                     <a href="view/listaTrabajadores.jsp" target="frame" class="mdl-layout__tab">Data Trabajadores</a>
=======
                    <a href="view/info.jsp" target="frame" class="mdl-layout__tab l1 is-active" onclick="ch('l1')">Info</a>
                    <a href="view/payroll.jsp" target="frame" class="mdl-layout__tab l2" onclick="ch('l2')">Planilla</a>
                    <a href="view/settings.jsp" target="frame" class="mdl-layout__tab l3" onclick="ch('l3')">Configuraciones</a>
                    <a href="view/contract.jsp" target="frame" class="mdl-layout__tab l4" onclick="ch('l4')">Contratos</a>
>>>>>>> origin/master
                </div>
            </header>
            <script>
                function ch(a) {
                    $(".l1").attr("class", "mdl-layout__tab l1");
                    $(".l2").attr("class", "mdl-layout__tab l2");
                    $(".l3").attr("class", "mdl-layout__tab l3");
                    $(".l4").attr("class", "mdl-layout__tab l4");
                    $("." + a + "").attr("class", "mdl-layout__tab l" + a + " is-active");
                }
            </script>
            <div class="mdl-layout__drawer">
                <span class="mdl-layout-title">Opciones</span>
                <nav class="mdl-navigation">
                    <a class="mdl-navigation__link" href="view/payroll.jsp" target="frame">Planilla</a>
                    <a class="mdl-navigation__link" href="view/settings.jsp" target="frame">Configuraciones</a>
                    <a class="mdl-navigation__link" href="view/contract.jsp" target="frame">Contratos</a>
                </nav>
            </div>
            <main class="mdl-layout__content">
                <iframe src="view/info.jsp"
                        name="frame" id="idframe" onload="loadFrame(this.contentWindow.location);"
                        style="width: 100%;height: 660px;overflow-y: hidden;border: none">
                </iframe>
            </main>
        </div>
    </body>
</html>
