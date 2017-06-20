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
        <title>SysConta 1.0</title>        
        <script src="resources/jquery-2.2.3.min.js" type="text/javascript"></script>        
        <link href="resources/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/pnotify.custom.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link rel="stylesheet" href="https://cdn.rawgit.com/CreativeIT/getmdl-select/master/getmdl-select.min.css">
        <script defer src="https://cdn.rawgit.com/CreativeIT/getmdl-select/master/getmdl-select.min.js"></script>
    </head>
    <body style="background: #4a148c">
    <center><h1 style="color: white">SysConta 1.0</h1></center>

    <div class="mdl-cell mdl-cell--12-col mdl-grid">
        <div class="mdl-cell mdl-cell--2-col mdl-grid"></div>
        <div class="demo-card-wide mdl-card mdl-shadow--4dp mdl-cell mdl-cell--4-col">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text" style="color:#4a148c">Iniciar Sesión</h2>
            </div>
            <form action="login" method="post">
            <div class="mdl-card__supporting-text">
                <input type="hidden" value="1" name="opc">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="iuser" name="nuser">
                        <label class="mdl-textfield__label" for="iuser">Usuario</label>
                    </div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="password" id="ipass" name="npass">
                        <label class="mdl-textfield__label" for="ipass">Contraseña</label>
                    </div>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <center><button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color: #4a148c">
                        Entrar
                    </button></center>
            </div>
            </form>
        </div>
        <div class="demo-card-wide mdl-card mdl-shadow--4dp mdl-cell mdl-cell--4-col">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text" style="color: #4a148c">Registra tu Empresa</h2>
            </div>
            <div class="mdl-card__supporting-text">
                <form>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="inamee">
                        <label class="mdl-textfield__label" for="iuser">Nombre de la Empresa</label>
                    </div>
                    <button id="show-dialog" type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Usuario Administrador</button>
                    <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
                        <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input">
                        <span class="mdl-checkbox__label">Acepto los términos y condiciones</span>
                    </label>
                </form>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <center><a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" onclick="regAdmin()" style="color: #4a148c">
                        Registrar
                    </a></center>
            </div>
        </div>
        <div class="mdl-cell mdl-cell--2-col mdl-grid"></div>
    </div>
    <footer class="mdl-mega-footer">
        <div class="mdl-mega-footer__middle-section">

            <div class="mdl-mega-footer__drop-down-section">
                <input class="mdl-mega-footer__heading-checkbox" type="checkbox" checked>
                <h1 class="mdl-mega-footer__heading">Integrantes</h1>
                <ul class="mdl-mega-footer__link-list">
                    <li><a href="#">Morales Gomez Arnold</a></li>
                    <li><a href="#">Chipana Berrocal Igor</a></li>
                    <li><a href="#">Pareja Valerio César</a></li>
                    <li><a href="#">Vargas Cisneros Zannier</a></li>                    
                    <li><a href="#">Burgos Robles Leandro</a></li>
                </ul>
            </div>

            <div class="mdl-mega-footer__drop-down-section">
                <input class="mdl-mega-footer__heading-checkbox" type="checkbox" checked>
                <h1 class="mdl-mega-footer__heading">Detalles de Curso</h1>
                <ul class="mdl-mega-footer__link-list">
                    <li><a href="#">Mg. Cachay Silvia</a></li>
                    <li><a href="#">Contabilidad</a></li>
                </ul>
            </div>

            <div class="mdl-mega-footer__drop-down-section">
                <input class="mdl-mega-footer__heading-checkbox" type="checkbox" checked>
                <h1 class="mdl-mega-footer__heading">Info</h1>
                <ul class="mdl-mega-footer__link-list">
                    <li><a href="#">Facultad de Ingeniería y Arquitectura</a></li>
                    <li><a href="#">E.P. Ingeniería de Sistemas</a></li>
                    <li><a href="#">V Ciclo</a></li>
                    <li><a href="#">Bayern Múnchen</a></li>
                </ul>
            </div>

        </div>
    </footer>
    <dialog class="mdl-dialog mdl-cell--6-col ">
        <h4 class="mdl-dialog__title">Usuario Administrador</h4>
        <div class="mdl-dialog__content">
            <form>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="iname">
                    <label class="mdl-textfield__label" for="iname">Nombres</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="iape">
                    <label class="mdl-textfield__label" for="iape">Apellidos</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="idni">
                    <label class="mdl-textfield__label" for="idni">DNI</label>
                    <span class="mdl-textfield__error">Ingrese un número</span>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="iusadm">
                    <label class="mdl-textfield__label" for="iusadm">Usuario</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="password" id="ipassadm">
                    <label class="mdl-textfield__label" for="ipassadm">Contraseña</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="password" id="ipassadmc">
                    <label class="mdl-textfield__label" for="ipassadmc">Confirmar Contraseña</label>
                </div>
            </form>
        </div>
        <div class="mdl-dialog__actions">
            <button type="button" class="mdl-button close"> Listo</button>
            <button type="button" class="mdl-button" onclick="clear()">Cerrar</button>
        </div>
    </dialog>   
    <script>
        //$(document).ready(function () {});
        function clear() {
            $("#inamee").attr("value", "");
            $("#iname").attr("value", "");
            $("#iape").attr("value", "");
            $("#idni").attr("value", "");
            $("#iusadm").attr("value", "");
            $("#ipassadm").attr("value", "");
            $("#ipassadmc").attr("value", "");
        }
        function regAdmin() {
            var emp = $("#inamee").val();
            var name = $("#iname").val();
            var ape = $("#iape").val();
            var dni = $("#idni").val();
            var user = $("#iusadm").val();
            var pass = $("#ipassadm").val();
            var passc = $("#ipassadmc").val();
            if (name != "" && ape != "" && user != "" && pass != "" && passc != "" && pass == passc && emp != "") {
                var url = "reg?opc=1&tipe=userRoot";
                var data = "name=" + name;
                data += "&ape=" + ape;
                data += "&dni=" + dni;
                data += "&user=" + user;
                data += "&pass=" + pass;
                data += "&emp=" + emp;
                $.post(url, data, function (pack) {
                    if (pack.rpta) {
                        new PNotify({
                            title: 'Correcto',
                            text: 'Ya puede Iniciar Sesión',
                            type: 'success'
                        });
                        clear();
                    }
                });

            } else {
                alert("Falta registrar algunos datos");
            }

        }
        /*function login() {
            var user = $("#iuser").val();
            var pass = $("#ipass").val();
            if (user != "" && pass != "") {
                var url = "login?opc=1";
                var data = "user=" + user;
                data += "&pass=" + pass;
                $.post(url, data);                
            }
        }*/

        var dialog = document.querySelector('dialog');
        var showDialogButton = document.querySelector('#show-dialog');
        if (!dialog.showModal) {
            dialogPolyfill.registerDialog(dialog);
        }
        showDialogButton.addEventListener('click', function () {
            dialog.showModal();
        });
        dialog.querySelector('.close').addEventListener('click', function () {
            dialog.close();
        });
    </script>
</body>
</html>
