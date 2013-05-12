$(function() {

    $(".nav-collapse ul.nav li a").click(function() {
        $(".nav li").removeClass("active");
        $(this).parent().siblings().removeClass("active");
        $(this).parent().addClass("active");
        location = $(this).attr("href");
    });
    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('/sap/loginController?action=CerrarSesion', function() {
                location = "/sap";

            });//fin post

        }
    });

});
