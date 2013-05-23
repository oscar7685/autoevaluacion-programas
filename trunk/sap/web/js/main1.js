$(function() {
    location = "/sap/#inicio";
    $(document).ajaxStart(function() {
        $("div.ui-layout-center").append("<div id='contenido'></div>");
        $("#contenido").hide();
        $("div.ui-layout-center").append("<div class='page_loading'>"
                + "<span>Cargando</span>"
                + "<img src='css/images/loading.gif' style='margin-left:6px;'>"
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
            //$("#conte").removeClass("span10").addClass("span12")
        }
        , west__onopen_end: function() {
            //$("#conte").removeClass("span12").addClass("span10")
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



    $(".nav-collapse ul.nav li a").click(function() {
        $(".nav li").removeClass("active");
        $(this).parent().siblings().removeClass("active");
        $(this).parent().addClass("active");
        location = $(this).attr("href");
    });

    var actualizaEnlaces = function() {
        $("ul.nav-list li a").click(function() {
            $(".nav li").removeClass("active");
            $(this).parent().addClass("active");
            location = $(this).attr("href");
        });
    };
    actualizaEnlaces();

    var menuProceso0 = function() {
        $("#menu0").html('<div  align="center" class="alert alert-block">' +
                ' <i class="icon-info-sign"></i> No existen proceso activos' +
                '</div>' +
                '<div id="menu" style="padding: 8px 0pt;" class="well">' +
                '<ul class="nav nav-list">  ' +
                '<button id="west-closer" class="close">&laquo;</button>' +
                '<li class="nav-header">Proceso de Atoevaluación</li>' +
                '<li><a href="#preparedCrearProceso"><i class="icon-plus"></i> Crear Proceso</a></li>' +
                '<li><a href="#listarProceso"><i class="icon-reorder"></i> Listar Procesos</a></li>' +
                '</ul>' +
                '</div>');
    };
    var menuProceso1 = function() {
        $("#menu0").html('<div align="center" class="alert alert-info"><i class="icon-cog"></i> Proceso en configuración</div>' +
                ' <div id="menu" style="padding: 8px 0pt;" class="well">' +
                '<ul class="nav nav-list">' +
                '<button id="west-closer" class="close">&laquo;</button>' +
                '<li class="nav-header">Proceso de Atoevaluación</li>' +
                '<li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>' +
                '<li class="nav-header">Ponderación</li>' +
                '<li><a href="#listPonderacionFactor"><i class="icon-list-ol"></i> Ponderar Factores</a></li>' +
                '<li><a href="#listPonderacionCara"><i class="icon-list-ol"></i> Ponderar Características</a></li>' +
                '<li class="nav-header">Muestra</li>' +
                '<li><a href="#listMuestra"><i class="icon-group"></i> Asignar Muestra</a></li>' +
                '<li class="divider"></li>' +
                '<li><a href="#iniciarProceso"><i class="icon-play-sign"></i> Iniciar proceso</a></li>' +
                '</ul>' +
                '</div>');
    };
    var menuProceso2 = function() {
        $("#menu0").html('<div align="center" class="alert alert-success"><i class="icon-play-sign"></i> Proceso en ejecución</div>' +
                '<div id="menu" style="padding: 8px 0pt;" class="well">' +
                '<ul class="nav nav-list">' +
                '<button id="west-closer" class="close">&laquo;</button>' +
                '<li class="nav-header">Proceso de Atoevaluación</li>' +
                '<li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>' +
                '<li><a href="#listPonderacionFactor"><i class="icon-list-ol"></i> Ponderación de Factores</a></li>' +
                '<li><a href="#listPonderacionCara"><i class="icon-list-ol"></i> Ponderación de Características</a></li>' +
                '</ul>' +
                '</div>');
    };


    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('/sap/loginController?action=CerrarSesion', function() {
                location = "/sap";

            });//fin post

        } else if (hash === "#preparedCrearProceso" || hash === "#listarProceso" || hash === "#detalleProceso" || hash === "#detalleProceso" || hash === "#preparedPonderarFactor" || hash === "#ponderarFactor" || hash === "#listPonderacionFactor" || hash === "#preparedPonderarCara" || hash === "#listPonderacionCara" || hash === "#preparedAsignarMuestra" || hash === "#selectorListMuestra" || hash === "#listMuestra" || hash === "#preparedEvaluador" || hash === "#preparedEditPonderarFactor" || hash === "#preparedEditPonderarCara" || hash === "#generarMuestraAleatoria") {
            var url3 = "/sap/" + hash;
            url3 = url3.replace('#', "controladorCP?action=");
            $("div.ui-layout-center").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("#contenido").append(data);
                    if ($("ul.nav-list li:eq(0)").html() !== "Modelo") {
                        myLayout.addCloseBtn("#west-closer", "west");
                    }
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });

                } //fin success
            }); //fin del $.ajax
        } else if (hash === "#crearProceso") {
            var url3 = "/sap/" + hash;
            url3 = url3.replace('#', "controladorCP?action=crearProceso") + "CC";
            $("div.ui-layout-center").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("#contenido").append(data);
                    menuProceso1();
                    myLayout.addCloseBtn("#west-closer", "west");
                    actualizaEnlaces();
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });

                } //fin success
            }); //fin del $.ajax
        } else if (hash === "#iniciarProceso") {
            var url3 = "/sap/" + hash;
            url3 = url3.replace('#', "controladorCP?action=");
            $("div.ui-layout-center").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                   // $("#contenido").append(data);
                    menuProceso2();
                    myLayout.addCloseBtn("#west-closer", "west");
                    actualizaEnlaces();
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });

                } //fin success
            }); //fin del $.ajax
        } else if (hash === "#listarFactores") {
            var url3 = "/sap/" + hash;
            url3 = url3.replace('#', "controladorCC?action=") + "CC";
            $("div.ui-layout-center").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("#contenido").append(data);
                    if ($("ul.nav-list li:eq(0)").html() !== "Factores") {
                        menuFactores();
                        myLayout.addCloseBtn("#west-closer", "west");
                        actualizaEnlaces();
                    }
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });

                } //fin success
            }); //fin del $.ajax
        }


    });

});
