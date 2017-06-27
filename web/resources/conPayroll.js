var dialog = document.querySelector('dialog');
dialog.querySelector('.close').addEventListener('click', function () {
    dialog.close();
});
$(document).ready(function () {
    $("#noData").hide();
    $("#yesData").hide();
    validar();
});
function validar() {
    var url = '../payroll';
    var data = 'opc=1';
    $.post(url, data, function (objJson) {
        var a = objJson.lista;
        if (a.length > 0) {
            listar(a);
            $("#yesData").show();
            $("#noData").hide();
        } else {
            $("#noData").show();
            $("#yesData").hide();
        }
    });
}

function listar(lista) {
    var m = '';
    for (var i = 0; i < lista.length; i++) {
        m += '<tr>';
        m += '<td>' + lista[i].persona + '</td>';
        m += '<td>' + lista[i].cargo + '</td>';
        m += '<td><button type="button" onclick="mod(1,' + lista[i].idpersona + ')" style="background: #3d5afe;color:white" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
        m += '<i class="material-icons">person</i>';
        m += '</button></td>';
        m += '<td>' + lista[i].sbasico + '</td>';
        m += '<td>1500</td>';
        m += '<td><button type="button" onclick="mod(2,' + lista[i].idpersona + ')" style="background: #76ff03;color:white" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
        m += '<i class="material-icons">trending_up</i>';
        m += '</button></td>';
        m += '<td>' + lista[i].impuesto + '</td>';
        m += '<td>54</td>';
        m += '<td><button type="button" onclick="mod(3,' + lista[i].idpersona + ')" id="btn3" style="background: #7b1fa2;color:white" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
        m += '<i class="material-icons">trending_down</i>';
        m += '</button></td>';
        m += '<td>' + lista[i].essalud + '</td>';
        m += '<td>54</td>';
        m += '<td>5400</td>';
        m += '</tr>';
    }
    $("#contT").empty();
    $("#contT").append(createTable());
    $("#CBody").empty();
    $("#CBody").append(m);
}

function mod(tipo, id) {
//EDITAR DEACUERDO AL ID
    if (tipo == 1) {
        $("#titleM").empty();
        $("#titleM").append("Datos del Trabajador     <i class='material-icons'>info</i>");
        var s = createContentWorker(id);
        $("#contenidoM").empty();
        $("#contenidoM").append(s);
    }
    if (tipo == 2) {
        $("#titleM").empty();
        $("#titleM").append("Remuneraciones");
        var s = createContentRemuneration(id);
        $("#contenidoM").empty();
        $("#contenidoM").append(s);
    }
    if (tipo == 3) {
        $("#titleM").empty();
        $("#titleM").append("Descuentos");
        var s = createContentDiscount(id);
        $("#contenidoM").empty();
        $("#contenidoM").append(s);
    }
    if (tipo == 4) {
        $("#titleM").empty();
        $("#titleM").append("Totales");
        var s = createContentTotal();
        $("#contenidoM").empty();
        $("#contenidoM").append(s);
    }
    dialog.showModal();
}

function createContentTotal() {
    var s = '<ul class="demo-list-two mdl-list">';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">trending_up</i>';
    s += '<span>Remuneraciones</span>';
    s += '<span class="mdl-list__item-sub-title" id="nafp"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="iafp"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">trending_down</i>';
    s += '<span>Descuentos</span>';
    s += '<span class="mdl-list__item-sub-title"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="impr"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">timeline</i>';
    s += '<span>Aportes</span>';
    s += '<span class="mdl-list__item-sub-title"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="iother"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">attach_money</i>';
    s += '<span>Total a Pagar</span>';
    s += '<span class="mdl-list__item-sub-title"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="iother"></a>';
    s += '</span>';
    s += '</li>';
    s += '</ul>';
    return s;
}

function createContentWorker(id) {
    var s = '<div>';
    s += '<ul class="demo-list-two mdl-list">';
    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">person</i>';
    s += '<span id="inw"></span>';
    s += '<span class="mdl-list__item-sub-title">Nombres y Apellidos</span>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">work</i>';
    s += '<span id="ica"></span>';
    s += '<span class="mdl-list__item-sub-title">Puesto de Trabajo</span>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">today</i>';
    s += '<span id="idl"></span>';
    s += '<span class="mdl-list__item-sub-title">Días Laborables</span>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">view_module</i>';
    s += '<span id="ihl"></span>';
    s += '<span class="mdl-list__item-sub-title">Horas Laborables</span>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">add</i>';
    s += '<span id="iex"></span>';
    s += '<span class="mdl-list__item-sub-title">Horas Extra</span>';
    s += '</span>';
    s += '</li>';
    s += '</ul>';
    s += '</div>';
    dataWorker(id);
    return s;
}

function dataWorker(id) {
    var url = '../payroll?opc=2';
    var data = 'id=' + id;
    $.post(url, data, function (objJson) {
        var a = objJson.trabajador;
        for (var i = 0; i < a.length; i++) {
            $("#inw").empty();
            $("#inw").append(a[i].persona);
            $("#ica").empty();
            $("#ica").append(a[i].cargo);
            $("#idl").empty();
            $("#idl").append(a[i].dlab);
            $("#ihl").empty();
            $("#ihl").append(a[i].hlab);
            $("#iex").empty();
            $("#iex").append(a[i].hextra);
        }
    });
}

function createContentDiscount(id) {
    var s = '<ul class="demo-list-two mdl-list">';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">info</i>';
    s += '<span>AFP</span>';
    s += '<span class="mdl-list__item-sub-title" id="nafp"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="iafp"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">gavel</i>';
    s += '<span>Impuesto a la Renta</span>';
    s += '<span class="mdl-list__item-sub-title"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="impr"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">remove_circle</i>';
    s += '<span>Otros</span>';
    s += '<span class="mdl-list__item-sub-title"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="iother"></a>';
    s += '</span>';
    s += '</li>';
    s += '</ul>';
    dataDiscount(id);
    return s;
}

function dataDiscount(id) {
    var url = '../payroll?opc=2';
    var data = 'id=' + id;
    $.post(url, data, function (objJson) {
        var a = objJson.trabajador;
        for (var i = 0; i < a.length; i++) {
            $("#nafp").empty();
            $("#nafp").append(a[i].cargo);
            $("#iafp").empty();
            $("#iafp").append(a[i].cargo + " " + "hijo(s)");
            $("#impr").empty();
            $("#impr").append(a[i].dlab);
            $("#iother").empty();
            $("#iother").append(a[i].hlab);
        }
    });
}

function createContentRemuneration(id) {
    var s = '<ul class="demo-list-two mdl-list">';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">attach_money</i>';
    s += '<span>Sueldo Básico</span>';
    s += '<span class="mdl-list__item-sub-title">Política (850.00)</span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="isb"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">child_friendly</i>';
    s += '<span>Asignación Familiar</span>';
    s += '<span class="mdl-list__item-sub-title" id="inh"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="iaf"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">check_circle</i>';
    s += '<span>Beneficios</span>';
    s += '<span class="mdl-list__item-sub-title">Otorgado por la Empresa</span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="ibe"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">add_circle</i>';
    s += '<span>Comisión</span>';
    s += '<span class="mdl-list__item-sub-title"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="ico"></a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">alarm_add</i>';
    s += '<span>Horas Extra</span>';
    s += '<span class="mdl-list__item-sub-title" id="inhe"></span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action" id="ihe"></a>';
    s += '</span>';
    s += '</li>';

    s += '</ul>';
    dataRemuneration(id);
    return s;
}

function dataRemuneration(id) {
    var url = '../payroll?opc=2';
    var data = 'id=' + id;
    $.post(url, data, function (objJson) {
        var a = objJson.trabajador;
        for (var i = 0; i < a.length; i++) {
            $("#isb").empty();
            var sbas = a[i].sbasico;
            $("#isb").append(sbas);
            $("#inh").empty();
            $("#inh").append(a[i].cargo + " " + "hijo(s)");
            $("#iaf").empty();
            $("#iaf").append(a[i].dlab);
            $("#ibe").empty();
            $("#ibe").append(a[i].hlab);
            $("#ico").empty();
            $("#ico").append(a[i].hextra);
            $("#inhe").empty();
            var h = a[i].hextra;
            $("#inhe").append(h);
            var f = 0;
            if (h > 0) {
                if (h > 2) {
                    var r = h - 2;
                    var p = (sbas / 30 / 8) * 2 * 1.25;
                    var t = (sbas / 30 / 8) * r * 1.35;
                    f = p + t;
                } else {
                    f = (sbas / 30 / 8) * h * 1.25;
                }
                f = f.toFixed(2);
                $("#ihe").empty();
                $("#ihe").append(f);
            } else {
                $("#ihe").empty();
                $("#ihe").append(0);
            }

        }
    });
}

function createTable() {
    var s = '<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="contTable" cellspacing="0" >';
    s += '<thead>';
    s += '<tr>';
    s += '<th colspan="3"><center>Datos del Trabajador</center></th>';
    s += '<th colspan="3" style="color: #558b2f"><center>Remuneraciones</center></th>';
    s += '<th colspan="3" style="color: #e65100"><center>Descuentos</center></th>';
    s += '<th colspan="2" style="color: #01579b"><center>Aportes</center></th>';
    s += '<th colspan="1" style="color: #d50000"><center>Monto a Pagar</center></th>';
    s += '</tr>';
    s += '<tr>';
    s += '<th class="tra">Apellidos y Nombres</th>';
    s += '<th class="tra">Ocupación</th>';
    s += '<th></th>';
    s += '<th style="color: #558b2f">Sueldo Básico</th>';
    s += '<th style="color: #558b2f">Total</th>';
    s += '<th></th>';
    s += '<th style="color: #e65100">Imp. Renta</th>';
    s += '<th style="color: #e65100">Total</th>';
    s += '<th></th>';
    s += '<th style="color: #01579b">EsSalud</th>';
    s += '<th style="color: #01579b">Total</th>';
    s += '<th style="color: #d50000">Total</th>';
    s += '</tr>';
    s += '</thead>';
    s += '<tbody id="CBody">';
    s += '</tbody>';
    s += '</table>';
    return s;
}

