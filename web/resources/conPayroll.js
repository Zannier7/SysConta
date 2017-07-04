var dialog = document.querySelector('dialog');
dialog.querySelector('.close').addEventListener('click', function () {
    dialog.close();
});
$(document).ready(function () {
    $("#noData").hide();
    $("#yesData").hide();
    validar();
});
var uit = 4050;
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
    var tremun = 0;
    var tdesc = 0;
    var taporte = 0;
    var total = 0;
    var tIMP = 0;
    for (var i = 0; i < lista.length; i++) {
        //CALCULO DE TOTAL
        var tp = 0;
        var remu = 0;
        var des = 0
        var h = lista[i].hextra;
        var sbas = lista[i].sbasico;
        var f = 0;
        var af = lista[i].afami;
        var caf = 0;
        var comi = lista[i].comision;
        var com = (comi / 100) * sbas;
        if (h > 0) {
            if (h > 2) {
                var r = h - 2;
                var p = (sbas / 30 / 8) * 2 * 1.25;
                var t = (sbas / 30 / 8) * r * 1.35;
                f = p + t;
            } else {
                f = (sbas / 30 / 8) * h * 1.25;
            }
        }
        if (af == 1) {
            caf = 85.00;
        }
        var bon = lista[i].bono;
        remu = parseInt(sbas) + parseInt(caf) + com + f + bon;//FALTA SUMAR LA COMISION
        tremun = tremun + remu;
        var inter = lista[i].interes;
        var ao = remu * inter;
        //CALCULO DEL IMP. RENTA
        var ip = remu * 14;
        var ImR = 0;
        var se = 7 * uit;//7 UIT
        var sr = ip - se;//Diferencia Sueldo - 7UITs
        var pc = 5 * uit;//Primera condicion (hasta 5 UITs)
        if (sr > pc) {
            var sc = 20 * uit;
            if (sr > sc) {
                var a = sc - pc;

            } else {//NO PASA DE LAS 20 UITs
                ImR = ((pc * 0.08) + ((sr - pc) * 0.14)) / 12;
            }
        } else {//NO PASA DE LAS 5 UITs
            if (sr < 0) {
                ImR = 0;
            } else {
                ImR = (sr * 0.08) / 12;
            }
        }
        des = ao + ImR;
        tIMP = tIMP + ImR;
        tdesc = tdesc + des;
        ImR = ImR.toFixed(2);
        var essa = 0.09 * remu;
        taporte = taporte + essa;
        tp = remu - des;
        total = total + tp;
        m += '<tr>';
        m += '<td>' + lista[i].persona + '</td>';
        m += '<td>' + lista[i].cargo + '</td>';
        m += '<td><button type="button" onclick="mod(1,' + lista[i].idpersona + ',' + remu + ')" style="background: #3d5afe;color:white" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
        m += '<i class="material-icons">person</i>';
        m += '</button></td>';
        m += '<td>' + lista[i].sbasico + '</td>';
        m += '<td>' + remu.toFixed(2) + '</td>';
        m += '<td><button type="button" onclick="mod(2,' + lista[i].idpersona + ',' + remu + ')" style="background: #76ff03;color:white" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
        m += '<i class="material-icons">trending_up</i>';
        m += '</button></td>';
        m += '<td>' + ImR + '</td>';
        m += '<td>' + des.toFixed(2) + '</td>';
        m += '<td><button type="button" onclick="mod(3,' + lista[i].idpersona + ',' + remu + ')" id="btn3" style="background: #7b1fa2;color:white" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">';
        m += '<i class="material-icons">trending_down</i>';
        m += '</button></td>';
        m += '<td>' + essa.toFixed(2) + '</td>';
        m += '<td><strong><span style="color:red">' + tp.toFixed(2) + '</span></strong></td>';
        m += '</tr>';
    }
    $("#totR").attr("value", tremun);
    $("#totD").attr("value", tdesc);
    $("#totA").attr("value", taporte);
    $("#totT").attr("value", total);
    $("#totI").attr("value", tIMP);
    $("#contT").empty();
    $("#contT").append(createTable());
    $("#CBody").empty();
    $("#CBody").append(m);
}

function mod(tipo, id, remu) {
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
        var s = createContentDiscount(id, remu);
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
    var R = 0;
    R = parseFloat($("#totR").val());
    var D = 0;
    D = parseFloat($("#totD").val());
    var A = 0;
    A = parseFloat($("#totA").val());
    var T = 0;
    T = parseFloat($("#totT").val());
    var s = '<ul class="demo-list-two mdl-list">';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">trending_up</i>';
    s += '<span>Remuneraciones</span>';
    s += '<span class="mdl-list__item-sub-title">Total de Remuneraciones</span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action">' + R.toFixed(2) + '</a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">trending_down</i>';
    s += '<span>Descuentos</span>';
    s += '<span class="mdl-list__item-sub-title">Total de Descuentos</span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action">' + D.toFixed(2) + '</a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">timeline</i>';
    s += '<span>Aportes</span>';
    s += '<span class="mdl-list__item-sub-title">Total de Aportes</span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action">' + A.toFixed(2) + '</a>';
    s += '</span>';
    s += '</li>';

    s += '<li class="mdl-list__item mdl-list__item--two-line">';
    s += '<span class="mdl-list__item-primary-content">';
    s += '<i class="material-icons mdl-list__item-avatar">attach_money</i>';
    s += '<span>Total a Pagar</span>';
    s += '<span class="mdl-list__item-sub-title">Suma de Totales</span>';
    s += '</span>';
    s += '<span class="mdl-list__item-secondary-content">';
    s += '<a class="mdl-list__item-secondary-action">' + T.toFixed(2) + '</a>';
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

function createContentDiscount(id, remu) {
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
    s += '<span class="mdl-list__item-sub-title" id="tipi"></span>';
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
    dataDiscount(id, remu);
    return s;
}

function dataDiscount(id, remu) {
    var url = '../payroll?opc=2';
    var data = 'id=' + id;
    $.post(url, data, function (objJson) {
        var a = objJson.trabajador;
        for (var i = 0; i < a.length; i++) {
            $("#nafp").empty();
            $("#nafp").append(a[i].AO + "(" + a[i].interes + ")");
            $("#iafp").empty();
            var s = 0;
            s = a[i].interes * remu;
            $("#iafp").append(s.toFixed(2));
            var tip = "";
            var ip = remu * 14;
            var ImR = 0;
            var se = 7 * uit;//7 UIT
            var sr = ip - se;//Diferencia Sueldo - 7UITs
            var pc = 5 * uit;//Primera condicion (hasta 5 UITs)
            if (sr > pc) {
                var sc = 20 * uit;
                if (sr > sc) {
                    var a = sc - pc;

                } else {//NO PASA DE LAS 20 UITs
                    ImR = ((pc * 0.08) + ((sr - pc) * 0.14)) / 12;
                    tip = "Entre 5 y 20 UIT (14%)";
                }
            } else {//NO PASA DE LAS 5 UITs
                if (sr < 0) {
                    ImR = 0;
                } else {
                    ImR = (sr * 0.08) / 12;
                    tip = "Menor o Igual a 5UIT (8%)";
                }
            }
            $("#impr").empty();
            $("#impr").append(ImR.toFixed(2));
            $("#tipi").empty();
            $("#tipi").append(tip);
            $("#iother").empty();
            $("#iother").append(0);
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
    s += '<span class="mdl-list__item-sub-title" id="pco"></span>';
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
            var af = a[i].afami;
            if (af == 1) {
                $("#iaf").empty();
                $("#iaf").append("85.00");
            } else {
                $("#iaf").empty();
                $("#iaf").append("0.00");
            }
            $("#isb").empty();
            var sbas = a[i].sbasico;
            $("#isb").append(sbas);
            $("#inh").empty();
            $("#inh").append("n " + "hijos");
            $("#ibe").empty();
            $("#ibe").append(a[i].bono);
            var comi = a[i].comision;
            var com = (comi / 100) * sbas;
            $("#pco").empty();
            $("#pco").append(comi + "%");
            $("#ico").empty();
            $("#ico").append(com);
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
    s += '<th colspan="1" style="color: #01579b"><center>Aportes</center></th>';
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
    s += '<th style="color: #d50000">Total</th>';
    s += '</tr>';
    s += '</thead>';
    s += '<tbody id="CBody">';
    s += '</tbody>';
    s += '</table>';
    return s;
}

function sendDiario() {

    var url = '../payroll';
    var data = 'opc=3';
    $.post(url, data, function (hola) {
        var id = hola.idplanilla;
        var R = parseFloat($("#totR").val());
        var D = parseFloat($("#totD").val());
        var A = parseFloat($("#totA").val());
        var I = parseFloat($("#totI").val());
        var X = R - D;
        var DE = R + A;
        var codigo = [621, 627, 4017, 4031, 4032, 407, 411];
        var denominacion = ["Remuneraciones", "EsSalud (Seguridad, previsión Social y otras contribuciones)", "Impuesto a la Renta", "EsSalud", "ONP", "AFP", "Remuneraciones por Pagar"];
        var monto = [R, A, I, A, 50, 60, X];
        var tipo = [1, 1, 2, 2, 2, 2, 2, 2];
        //CENTRALIZACION
        for (var i = 0; i < codigo.length; i++) {
            var url = "../payroll?opc=4";
            var data = "idplanilla=" + id;
            data += "&ntotal=1";
            data += "&codigo=" + codigo[i];
            data += "&denominacion=" + denominacion[i];
            data += "&monto=" + monto[i].toFixed(2);
            data += "&movimiento=" + tipo[i];
            $.post(url, data);
        }
        //PAGO
        var codigoP = [4017, 4031, 4032, 407, 411, 101];
        var denominacionP = ["Impuesto a la Renta", "EsSalud", "ONP", "AFP", "Remuneraciones por Pagar", "Caja"];
        var montoP = [I, A, 50, 60, X, DE];
        var tipoP = [1, 1, 1, 1, 1, 2];
        for (var i = 0; i < codigoP.length; i++) {
            var url = "../payroll?opc=4";
            var data = "idplanilla=" + id;
            data += "&ntotal=2";
            data += "&codigo=" + codigoP[i];
            data += "&denominacion=" + denominacionP[i];
            data += "&monto=" + montoP[i];
            data += "&movimiento=" + tipoP[i];
            $.post(url, data);
        }
        //DESTINO
        var codigoD = [94, 79];
        var denominacionD = ["Gastos Administrativos", "Cargas Imputables a cuentas de Costos y Gastos"];
        var montoD = [DE, DE];
        var tipoD = [1, 2];
        for (var i = 0; i < codigoD.length; i++) {
            var url = "../payroll?opc=4";
            var data = "idplanilla=" + id;
            data += "&ntotal=3";
            data += "&codigo=" + codigoD[i];
            data += "&denominacion=" + denominacionD[i];
            data += "&monto=" + montoD[i];
            data += "&movimiento=" + tipoD[i];
            $.post(url, data);
        }
        $("#sdiario").hide();

    });
}