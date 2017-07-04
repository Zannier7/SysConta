<%-- 
    Document   : extra
    Created on : 04/07/2017, 03:14:36 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>        
        <link href="resources/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link href="resources/Material+Icons.css" rel="stylesheet" type="text/css"/>
        <script src="resources/material.js" type="text/javascript"></script>
        <link href="resources/material.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/material.min.js" type="text/javascript"></script>
    </head>
    <body>
        <style>
            .demo-layout-waterfall .mdl-layout__header-row .mdl-navigation__link:last-of-type  {
                padding-right: 0;
            }
        </style>

        <div class="demo-layout-waterfall mdl-layout mdl-js-layout">
            <header class="mdl-layout__header mdl-layout__header--waterfall">
                <!-- Top row, always visible -->
                <div class="mdl-layout__header-row">
                    <!-- Title -->
                    <span class="mdl-layout-title"></span>
                    <div class="mdl-layout-spacer"></div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                         mdl-textfield--floating-label mdl-textfield--align-right">
                        <label class="mdl-button mdl-js-button mdl-button--icon"
                               for="waterfall-exp">
                            <i class="material-icons">home</i>
                        </label>
                        <div class="mdl-textfield__expandable-holder">
                            <input class="mdl-textfield__input" type="text" name="sample"
                                   id="waterfall-exp">
                        </div>
                    </div>
                </div>
                <div class="mdl-layout__header-row">
                    <div class="mdl-layout-spacer"></div>
                    <nav class="mdl-navigation">
                    </nav>
                </div>
            </header>
            <div class="mdl-layout__drawer">
                <span class="mdl-layout-title">Title</span>
                <nav class="mdl-navigation">
                </nav>
            </div>
            <main class="mdl-layout__content">
                <div class="page-content">

                    <form action="#">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="sample3">
                            <label class="mdl-textfield__label" for="sample3">Text...</label>
                        </div>
                    </form>



                </div>
            </main>
        </div>
    </body>
</html>
