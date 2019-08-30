
(function ($) {
    
    //$("#div_btn_susbribir").attr("hidden", "hidden");
    $("#spinner_load_suscribir").attr("hidden", "hidden");


    $("#spinner_load_contacto").attr("hidden", "hidden");
    //$("#div_btn_contacto").attr("hidden", "hidden");
    "use strict";

    /*==================================================================
    [ Focus Contact2 ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })

    $('.select100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })

    /*==================================================================
    [ Validate ]*/
    
    function ValidaContacto() {
        //var input = $('.validate-input .input100');
        //var select = $('.validate-select .select100');    
        var esValido = true;


        if ($("#inputMail").attr('type') == 'email' || $("#inputMail").attr('name') == 'email') {
            if ($("#inputMail").val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                showValidate("#inputMail");
                esValido = false;
            }
        }

        if ($("#inputNegocio").val().trim() == '' || $("#inputNegocio").val() == null || $("#inputNegocio").val() == 0) {
            showValidate("#inputNegocio");
            esValido = false;
        }

        if ($("#inputTelCelular").val().trim() == '' || $("#inputTelCelular").val() == null || $("#inputTelCelular").val() == 0 || $("#selectTelRegion").val() == 0) {
            showValidate("#inputTelCelular");
            esValido = false;
        }

        if ($("#inputNombre").val().trim() == '' || $("#inputNombre").val() == null || $("#inputNombre").val() == 0) {
            showValidate("#inputNombre");
            esValido = false;
        }

        if ($("#inputPresupuesto").val().trim() == '' || $("#inputPresupuesto").val() == null || $("#inputPresupuesto").val() == 0) {
            showValidate("#inputPresupuesto");
            esValido = false;
        }

        if ($("#inputMedioContacto").val().trim() == '' || $("#inputMedioContacto").val() == null || $("#inputMedioContacto").val() == 0) {
            showValidate("#inputMedioContacto");
            esValido = false;
        }

        if ($("#selectTipoProyecto").val() == null || $("#selectTipoProyecto").val() == 0) {
            showValidate("#selectTipoProyecto");
            esValido = false;
        }

        

        return esValido;
    }

    $('.validate-form').on('submit', function (evt) {
        event.preventDefault();
        $("#div_btn_contacto").attr("hidden", "hidden");
        $("#spinner_load_contacto").removeAttr("hidden");
        var formLleno = ValidaContacto();

        var datosCorreo = {};

        datosCorreo.nombreNegocio = $("#inputNegocio").val();
        datosCorreo.mail = $("#inputMail").val();
        datosCorreo.tipoProyecto = $("#selectTipoProyecto option:selected").text();
        datosCorreo.telCelular = $("#selectTelRegion option:selected").val() + $("#inputTelCelular").val();
        datosCorreo.nombreInteresado = $("#inputNombre").val();
        datosCorreo.presupuesto = $("#inputPresupuesto").val();
        datosCorreo.medioConctacto = $("#inputMedioContacto").val();

        if (formLleno == true) {

            $.ajax({
                method: "POST",
                url: rootUrl("/Correo/EnviarCorreoConctacto"),
                data: datosCorreo,
                dataType: "json",
                //async: false,
                success: function (data) {

                    if (data.estatus) {
                        $("#spinner_load_contacto").attr("hidden", "hidden");
                        $("#div_btn_contacto").removeAttr("hidden");

                        $("#modalCorreoEnviado-texto").text("¡ El correo de contacto se ha enviado, nos pndremos en contacto contigo despues de cotizar tu proyecto !")
                        $('#modalCorreoEnviado').modal({ fadeDuration: 100, backdrop: 'static' });

                        LimpiarFromularios();
                    }

                },
                error: function (xhr, status, error) {
                    alert(error);
                },
            });

            //alert("Todo Bien");
        }
        else {
            $("#spinner_load_contacto").attr("hidden", "hidden");
            $("#div_btn_contacto").removeAttr("hidden");
        }

        
    });

    
    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    $('.validate-form .select100').each(function () {
        $(this).focus(function () {
            hideValidate(this);
        });
    });

   

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    

})(jQuery);

//Evento suscribirse
function onClickSuscribirse() {
    
    

    var suscribirEsValido = true;


    if ($("#inputSuscribirseMail").attr('type') == 'email' || $("#inputSuscribirseMail").attr('name') == 'email') {
        if ($("#inputSuscribirseMail").val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
            showValidate("#inputSuscribirseMail");
            suscribirEsValido = false;
        }
    }

    if ($("#inputSuscribirseNombre").val().trim() == '' || $("#inputSuscribirseNombre").val() == null || $("#inputSuscribirseNombre").val() == 0) {
        showValidate("#inputSuscribirseNombre");
        suscribirEsValido = false;
    }

    var datosCorreo = {};

    
    datosCorreo.mail = $("#inputSuscribirseMail").val();    
    datosCorreo.nombreInteresado = $("#inputSuscribirseNombre").val();

    if (suscribirEsValido == true) {

        $("#div_btn_susbribir").attr("hidden", "hidden");
        $("#spinner_load_suscribir").removeAttr("hidden");

        $.ajax({
            method: "POST",
            url: rootUrl("/Correo/EnviarCorreoSuscribcion"),
            data: datosCorreo,
            dataType: "json",
            //async: false,
            success: function (data) {

                if (data.estatus) {
                    $("#spinner_load_suscribir").attr("hidden", "hidden");
                    $("#div_btn_susbribir").removeAttr("hidden");

                    $("#modalSuscribirse").modal("hide");
                    $("#modalCorreoEnviado-texto").text("! Gracias por suscribirte, recibiras via correo electronico nuestras noticias mas reciente !")
                    $('#modalCorreoEnviado').modal({ fadeDuration: 100, backdrop: 'static' });
                    LimpiarFromularios();
                }

            },
            error: function (xhr, status, error) {
                alert(error);
            },
        });
    }
    

}

function LimpiarFromularios() {
    //Formulario de suscripcion//
    $("#inputSuscribirseMail").val("");
    $("#inputSuscribirseNombre").val("");

    //Formulario de contacto//
    $("#inputNegocio").val("");
    $("#inputMail").val("");
    $("#selectTipoProyecto").val(0);
    $("#inputTelCelular").val("");
    $("#inputNombre").val("");
    $("#inputPresupuesto").val("");
    $("#inputMedioContacto").val("");
    $("#selectTelRegion").val(0);
}

//$(function () {
//    $(document).on('change', '#selectTelRegion', function () {
//        $("#inputTelCelular").focus();
//        var value = $(this).val();
//        $('#inputTelCelular').val(value);

//    });
//});

function formatCurrency(num) {
    num = num.toString().replace(/ |,/g, '');
    num = num.toString().replace('$', '');
    if (isNaN(num))
        num = "0";
    cents = Math.floor((num * 100 + 0.5) % 100);
    num = Math.floor((num * 100 + 0.5) / 100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
    return ('$' + num + '.' + cents);
}

function validaNumeros(value) {
    return value.match(/^\d+\.?\d{0,1}/);
}