<%-- 
    Document   : register
    Created on : 13/06/2017, 05:16:51 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link rel="stylesheet" href="https://cdn.rawgit.com/CreativeIT/getmdl-select/master/getmdl-select.min.css">
        <script defer src="https://cdn.rawgit.com/CreativeIT/getmdl-select/master/getmdl-select.min.js"></script>
    </head>
    <body>
    <center>
        <div>
            <h3>Contrato</h3>
            <form action="#">
                <div style="width: 80%;">
                    <div style="width: 100%;height: 150px;"><!--DATOS PERSONALES-->
                        <h5 style="text-align: left">Datos personales</h5>
                        <div style="width: 33%;float: left">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" id="sample3">
                                <label class="mdl-textfield__label" for="sample3">Nombre(s)</label>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                <label class="mdl-textfield__label" for="sample4">DNI</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" id="sample3">
                                <label class="mdl-textfield__label" for="sample3">Apellidos</label>
                            </div><br/>
                        </div>
                        
                    </div>
                    <div style="width: 100%;height: 150px;d"><!--DATOS DE TRABAJO-->
                        <h5 style="text-align: left">Datos de trabajo</h5>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                <label class="mdl-textfield__label" for="sample4">Horas Laborales</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: right">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                <label class="mdl-textfield__label" for="sample4">Horas Laborales</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                        <div style="width: 33%;float: left">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth">
                                <input class="mdl-textfield__input" type="text" id="sample1" value="Seleccionar" readonly tabIndex="-1">
                                <label for="sample1" class="mdl-textfield__label">Puesto de Trabajo</label>
                                <ul for="sample1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                    <li class="mdl-menu__item">Esclavo</li>
                                    <li class="mdl-menu__item">Barrendero</li>
                                    <li class="mdl-menu__item">Garitero</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div style="width: 100%;height: 150px;d"><!--DATOS Financieros-->
                        <h5 style="text-align: left">Datos Financieros</h5>
                        <div style="width: 33%;float: right">
                            
                        </div>
                        <div style="width: 33%;float: right">
                            
                        </div>
                        <div style="width: 33%;float: left">
                             <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                <label class="mdl-textfield__label" for="sample4">Sueldo Base</label>
                                <span class="mdl-textfield__error">¡No es un número!</span>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </center>
</body>
</html>
