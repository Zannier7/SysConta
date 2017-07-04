<%-- 
    Document   : index
    Created on : 13/06/2017, 11:57:36 AM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html lang="es" style="height: 100%;overflow-y: hidden">
    <head>
        <title>SysConta || UPeU</title>  
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/ico" href="resources/money.ico" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>        
        <link href="resources/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link href="resources/Material+Icons.css" rel="stylesheet" type="text/css"/>
        <script src="resources/material.js" type="text/javascript"></script>
        <link href="resources/material.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/material.min.js" type="text/javascript"></script>
    </head>
    <body style="height: 100%;overflow-y: hidden">

        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header">
                <!-- Tabs -->
                <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
                    <a href="view/info.jsp" target="frame" class="mdl-layout__tab l1 is-active" onclick="ch('l1')">Info</a>
                    <a href="main?opc=4" target="frame" class="mdl-layout__tab l2" onclick="ch('l2')">Planilla</a>
                    <!-- <a href="view/settings.jsp" target="frame" class="mdl-layout__tab l3" onclick="ch('l3')">Configuraciones</a>-->
                    <!--<a href="view/contract.jsp" target="frame" class="mdl-layout__tab l4" onclick="ch('l4')">Contratos</a>-->
                    <a href="main?opc=6" class="mdl-layout__tab" style="float: right">.<i class="material-icons">home</i></a>
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
                    <!--<a class="mdl-navigation__link" href="view/settings.jsp" target="frame">Configuraciones</a>-->
                    <!--<a class="mdl-navigation__link" href="view/contract.jsp" target="frame">Contratos</a>-->
                </nav>
            </div>
            <main class="mdl-layout__content">
                <iframe src="view/info.jsp"
                        name="frame" id="idframe" style="overflow-y: hidden;border: none;width: 100%;height: 100%;">
                </iframe>
            </main>
        </div>
    </body>
</html>
