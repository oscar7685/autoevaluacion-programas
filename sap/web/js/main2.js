$(function() {
    location = "/sap/#inicio";
    $(document).ajaxStart(function() {
        $("div.ui-layout-center").append("<div id='contenido'></div>");
        $("#contenido").hide();
        $("div.ui-layout-center").append(""
                + "<div id='dancing-dots-text'>"
                + "Cargando <span><span>.</span><span>.</span><span>.</span><span>.</span><span>.</span></span> "
                + "</div>");
    });

    var myLayout;
    myLayout = $('body').layout({
        //	enable showOverflow on west-pane so CSS popups will overlap north pane
        west__size: 270
                , center__paneSelector: ".ui-layout-center"
                , north__paneClass: "ui-layout-pane2"
                //	reference only - these options are NOT required because 'true' is the default
                , closable: true	// pane can open & close
                , resizable: false	// when open, pane can be resized 
                , slidable: false	// when closed, pane can 'slide' open over other panes - closes on mouse-out
                , north__size: 1
                , north__closable: false
                , north__maxSize: 1
                , north__slidable: false	// OVERRIDE the pane-default of 'slidable=true'
                , north__spacing_open: 0		// no resizer-bar when open (zero height)
                , south__resizable: false	// OVERRIDE the pane-default of 'resizable=true'
                , south__closable: false
                , south__spacing_open: 0		// no resizer-bar when open (zero height)
                , west__spacing_open: 0
                , west__spacing_closed: 20
                , west__togglerLength_closed: 35
                , west__togglerAlign_closed: "top"
                , west__togglerContent_closed: "<button id='west-open' class='close' style='float:left;margin-left:4px;opacity:1;margin-top:-10px;'>&raquo;</button>"
                , west__togglerTip_closed: "Mostrar menú"
                , west__togglerTip_open: "Ocultar menú"
                , west__onclose_end: function() {
            $("#conte").removeClass("span10").addClass("span12");
        }
        , west__onopen_end: function() {
            $("#conte").removeClass("span12").addClass("span10");
        }
        , south__paneClass: "ui-layout-pane"
                , west__togglerContent_open: ""
                , west__minSize: 200
                , west__maxSize: 350


    });
    myLayout.allowOverflow('north');
    // setTimeout( myLayout.resizeAll, 1000 ); /* allow time for browser to re-render with new theme */
    // save selector strings to vars so we don't have to repeat it
    // must prefix paneClass with "body > " to target ONLY the outerLayout panes
    myLayout.addCloseBtn("#west-closer", "west");




    var actualizaEnlaces = function(hash) {
        $(".nav li").removeClass("active");
        $("a[href='" + hash + "']").parent().addClass("active");
    };


    var menuModelo = function() {
        $("#menu").html('<ul class="nav nav-list"> ' +
                '<button id="west-closer" class="close">&laquo;</button>' +
                '<li class="nav-header">Modelo</li>' +
                '<li><a href="#crearModelo"><i class="icon-plus"></i> Crear Modelo</a></li>' +
                '<li><a href="#listarModelo"><i class="icon-reorder"></i> Listar Modelos</a></li>' +
                '</ul>');
    };
    var menuFactores = function() {
        $("#menu").html('<ul class="nav nav-list">' +
                '<button id="west-closer" class="close">&laquo;</button>' +
                '<li><a href="#listarModelo"><i class="icon-level-up"></i>Men&uacute; modelo</a></li>' +
                '<li class="nav-header">Factores</li>' +
                '<li><a href="#listarFactores"><i class="icon-th-large"></i> Listar factores</a></li>' +
                '<li class="divider"></li>' +
                '<li class="nav-header">Caracteristicas</li>' +
                '<li><a href="#listarCaracteristicas"><i class="icon-th-list"></i> Listar caracteristicas</a></li>' +
                '<li class="divider"></li>' +
                '<li class="nav-header">Indicadores</li>' +
                '<li><a href="#listarIndicadores"><i class="icon-list"></i> Listar indicadores</a></li>' +
                '<li class="divider"></li>' +
                '<li class="nav-header">Preguntas</li>' +
                '<li><a href="#listarPreguntas"><i class="icon-question"></i> Listar preguntas</a></li>' +
                '<li class="divider"></li>' +
                '<li class="nav-header">Encuestas</li>' +
                '<li><a href="#listarEncuestas"><i class="icon-tasks"></i> Listar encuestas</a></li>' +
                '</ul>');
    };

    var hash;
    $(window).hashchange(function() {
        hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('/sap/loginController?action=CerrarSesion', function() {
                location = "/sap";

            });//fin post

        } else {
            if (hash === "#inicio") {
                var url3 = "/sap/" + hash;
                url3 = url3.replace('#', "controladorCC?action=") + "CC";
                $("div.ui-layout-center").empty();
                $.ajax({
                    type: "POST",
                    url: url3,
                    success: function(data)
                    {
                        $("#contenido").append(data);
                        $("#contenido").show(200, function() {
                            menuModelo();
                            $("#dancing-dots-text").hide();
                        });
                        actualizaEnlaces(hash);
                    } //fin success
                }); //fin del $.ajax
            } else {
                if (hash.indexOf("#entrarModelo") !== -1 || hash.indexOf("#editarEncuesta") !== -1 || hash.indexOf("#vistaPreviaEncuesta") !== -1) {
                    var cual = hash.split("&");
                    hash = cual[0];
                    var url3 = "/sap/controladorCC?action=";
                    url3 = url3.concat(cual[0].substring(1), "CC&id=", cual[1]);
                    $("div.ui-layout-center").empty();
                    $.ajax({
                        type: "POST",
                        url: url3,
                        success: function(data)
                        {
                            $("#contenido").append(data);

                            if ($("ul.nav-list li:eq(1)").html() !== "Factores") {
                                menuFactores();
                                myLayout.addCloseBtn("#west-closer", "west");
                            }
                            $("#contenido").show(200, function() {
                                $("#dancing-dots-text").hide();
                            });



                            actualizaEnlaces(hash);
                        } //fin success
                    }); //fin del $.ajax

                } else {
                    if (hash === "#crearModelo" || hash === "#listarModelo") {
                        var url3 = "/sap/" + hash;
                        url3 = url3.replace('#', "controladorCC?action=") + "CC";
                        $("div.ui-layout-center").empty();
                        $.ajax({
                            type: "POST",
                            url: url3,
                            success: function(data)
                            {
                                $("#contenido").append(data);
                                if ($("ul.nav-list li:eq(0)").html() !== "Modelo") {
                                    menuModelo();
                                    myLayout.addCloseBtn("#west-closer", "west");

                                }
                                $("#contenido").show(200, function() {
                                    $("#dancing-dots-text").hide();
                                });
                                actualizaEnlaces(hash);
                            }

                        }); //fin del $.ajax
                    } else {
                        if (hash === "#listarFactores" || hash === "#crearFactor"
                                || hash === "#listarCaracteristicas" || hash === "#crearCaracteristica"
                                || hash === "#listarIndicadores" || hash === "#crearIndicador"
                                || hash === "#listarPreguntas" || hash === "#crearPregunta"
                                || hash === "#listarEncuestas" || hash === "#crearEncuesta") {
                            var url3 = "/sap/" + hash;
                            url3 = url3.replace('#', "controladorCC?action=") + "CC";
                            $("div.ui-layout-center").empty();
                            $.ajax({
                                type: "POST",
                                url: url3,
                                success: function(data)
                                {
                                    $("#contenido").append(data);
                                    if ($("ul.nav-list li:eq(1)").html() !== "Factores") {
                                        menuFactores();
                                        myLayout.addCloseBtn("#west-closer", "west");
                                    }
                                    $("#contenido").show(200, function() {
                                        $("#dancing-dots-text").hide();
                                    });
                                    actualizaEnlaces(hash);
                                } //fin success
                            }); //fin del $.ajax
                        }
                    }
                }

            }

        }
    });

});
