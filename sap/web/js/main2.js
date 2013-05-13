$(function() {
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

    $("ul.nav-list li a").click(function(event) {
        $(".nav li").removeClass("active");
        $("ul.nav-list li a").children("i").removeClass("icon-white");
        $(this).parent().addClass("active");
        $(this).children("i").addClass("icon-white");
        location = $(this).attr("href");
    })

    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('/sap/loginController?action=CerrarSesion', function() {
                location = "/sap";

            });//fin post

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
                        $("#contenido").show(200, function() {
                            $(".page_loading").hide();
                        });

                    } //fin success
                }); //fin del $.ajax
            }
        }
    });

});
