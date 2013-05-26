<%
    HttpSession session1 = request.getSession();
    String aux = (String) session1.getAttribute("tipoLogin");
    if (aux == null || aux.equals("")) {
    } else {
        if (aux.equals("Comite programa")) {
            RequestDispatcher rd = request.getRequestDispatcher("/controladorCP?action=indexCP");
            rd.forward(request, response);
        } else {
            if (aux.equals("Comite central")) {
                RequestDispatcher rd = request.getRequestDispatcher("/controladorCC?action=indexCC");
                rd.forward(request, response);
            } else {
                if (aux.equals("Fuente")) {
                    RequestDispatcher rd = request.getRequestDispatcher("/controladorF?action=indexF");
                    rd.forward(request, response);
                }
            }
        }
    }

%>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link href="css/layout-sitenav.css" type="text/css" rel="stylesheet" media="screen">
        <title></title>
        <link href="http://fonts.googleapis.com/css?family=Lobster|Oswald|Kaushan+Script" rel="stylesheet" type="text/css">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link href="css/slider.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/otro.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a href="index.html" class="brand">Sistema de Autoevaluaci�n de Programas</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav barra" >
                            <li class="active"><a href="#inicio"><i class="icon-home"></i> Inicio</a></li>
                            <li><a href="#contacto"><i class="icon-phone"></i> Contacto</a></li>
                            <li ><a href="#"><i class="icon-info-sign"></i> Acerca de</a></li>
                            <li><a href="#ingresar"><i class="icon-user"></i>Ingresar</a></li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <header class="inicio">
            <div class="header-content home">
                <div class="parallax-bg" id="slider-wrap">
                    <div class="slider parallax-bg" id="slider"> <div class="slider-sections sandbox"> 
                            <section class="first"> <img alt="Kendo UI" src="img/home-banner-1.png"/> <div class="text"> <h2>SAP UdeC 1.0<br />
                                        Una nueva historia </h2> <p class="copy">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p> <p class="button"><a href="http://www.lanrentuku.com/" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);">Download</a> <a class="dimmed" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);" href="http://www.lanrentuku.com/">Learn More</a></p> </div> </section>
                            <section> <img src="img/dataviz-home-image-q2.png" alt="Informes" /> <div class="text" style="padding-top: 10px;"> <h2>Analice resultados</h2> <p class="copy">Realiza el procesamiento y sistematizaci�n de la informaci�n recolectada, mostrando informes en tiempo real.</p> <p class="button"><a >Ver m&aacute;s</a></p> </div> </section>
                            <section> <img src="img/home_banner_web-q2.png" alt="Kendo UI" /> <div class="text"> <h2>Informes en tiempo real</h2> <p class="copy">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris</p> <p class="button"><a href="http://www.lanrentuku.com/" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);">Download</a> <a class="dimmed" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);" href="http://www.lanrentuku.com/">Learn More</a></p> </div> </section></div> </div> <a class="slider-prev" href="javascript: void(0)">?</a> <a class="slider-next" href="javascript: void(0)">?</a>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="row" id="login" style="display: none">
                <form name="formularioLogin" class="form-signin" id="formulario_login">
                    <div class="alert alert-error fade in" id="login-error" style="display:none;">
                        <button type="button" class="close" id="close1">�</button>
                    </div>
                    <h2 class="form-signin-heading">Ingresar</h2>
                    <input type="text" placeholder="Usuario" name="codigo" id="codigo" class="input-block-level {required:true}">
                    <input type="password" placeholder="Contrase�a" name="clave" id="pass" class="input-block-level {required:true}" >
                    <label>Perfil de ingreso</label>
                    <select id="perfilIngreso" name="perfilIngreso" class="input-block-level">
                        <option>Comite central</option>
                        <option>Comite programa</option>
                        <optgroup label="Fuente">
                            <option>Estudiantes</option>
                            <option>Docentes</option>
                            <option>Administrativos</option>
                            <option>Egresados</option>
                            <option>Directivos</option>
                            <option>Agencias Gubernamentales</option>
                            <option>Empleadores</option>
                        </optgroup>
                    </select>
                    <label class="checkbox">
                        <input type="checkbox" value="remember-me"> Recordar
                    </label>
                    <button id="btnIniciar" type="submit" class="btn btn-large btn-primary">Iniciar sesi&oacute;n</button>
                </form>
            </div>

            <!-- Example row of columns -->
            <div class="row inicio">
                <div class="span4">
                    <h2>Heading</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
                <div class="span4">
                    <h2>Heading</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
                <div class="span4">
                    <h2>Heading</h2>
                    <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
            </div>

            <hr>

            <footer>
                <p>&copy; Universidad de Cartagena 2013</p>
            </footer>

        </div> <!-- /container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/jquery.metadata.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ba-hashchange.min.js"></script>
        <script src="js/main.js"></script>
        <script type='text/javascript' src='js/slider.js'></script>
    </body>
</html>
