<%-- 
    Document   : login
    Created on : 14/06/2017, 09:42:03 AM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        
    </head>
    <body style="background: #1de9b6">
    <center>
        <br/><br/><br/>
        <div class="demo-card-wide mdl-card mdl-shadow--4dp" style="width: 20%">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Iniciar Sesión</h2>
            </div>
            <div class="mdl-card__supporting-text">
                <form>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="iuser">
                        <label class="mdl-textfield__label" for="iuser">Usuario</label>
                    </div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="password" id="ipass">
                        <label class="mdl-textfield__label" for="ipass">Contraseña</label>
                    </div>
                </form>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <center><a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #1de9b6" onclick="login()">
                        Entrar
                    </a></center>
            </div>
        </div>
    </center>
    <script>
        //$(document).ready(function () {});
            function login() {
                var user = $("#iuser").val();
                var pass = $("#ipass").val();
                if (user != "" && pass != "") {
                    var url="login?opc=1";
                    var data="user="+user;
                    data +="&pass="+pass;
                    $.post(url,data,function(objJson){
                        alert(objJson.rpta);
                    });
                }
            }
        
    </script>
</body>
</html>
