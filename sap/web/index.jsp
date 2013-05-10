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
        <style>
            body {
                padding-top: 60px;
                /* padding-bottom: 40px;*/
            }
        </style>
        <style type="text/css">
            .form-signin label{
                margin-bottom: 2px;
            }
            .form-signin {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                background-color: #fff;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
                margin-top: 80px;
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"],
            .form-signin select{
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;
            }

        </style>
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="css/main.css">

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
                    <a href="index.html" class="brand">Sistema de Autoevaluación de Programas</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li class="active"><a href="#inicio">Inicio</a></li>
                            <li><a href="#">About</a></li>
                            <li ><a href="#">Products</a></li>
                            <li><a href="#">Gallery</a></li>
                            <li><a href="#ingresar">Ingresar</a></li>
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
                            <section> <img src="img/dataviz-home-image-q2.png" alt="Kendo UI" /> <div class="text" style="padding-top: 10px;"> <h2>Control de historicos</h2> <p class="copy">porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris</p> <p class="button"><a href="http://www.lanrentuku.com/" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);">Download</a> <a class="dimmed" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);" href="http://www.lanrentuku.com/">Learn More</a></p> </div> </section>
                            <section> <img src="img/home_banner_web-q2.png" alt="Kendo UI" /> <div class="text"> <h2>Informes en tiempo real</h2> <p class="copy">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris</p> <p class="button"><a href="http://www.lanrentuku.com/" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);">Download</a> <a class="dimmed" onclick="_gaq.push(['_trackPageview', 'http://www.lanrentuku.com/']);" href="http://www.lanrentuku.com/">Learn More</a></p> </div> </section></div> </div> <a class="slider-prev" href="javascript: void(0)">?</a> <a class="slider-next" href="javascript: void(0)">?</a>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="row" id="login" style="display: none">
                <form name="formularioLogin" class="form-signin">
                    <h2 class="form-signin-heading">Ingresar</h2>
                    <input type="text" placeholder="Usuario" id="codigo" class="input-block-level">
                    <input type="password" placeholder="Contraseña" id="pass" class="input-block-level">
                    <label>Perfil de ingreso</label>
                    <select id="perfilIngreso" class="input-block-level">
                        <option>Comite central</option>
                        <option>Comite de programa</option>
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
                    <button id="btnIniciar" type="button" class="btn btn-large btn-primary">Iniciar sesi&oacute;n</button>
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
                <p>&copy; Company 2012</p>
            </footer>

        </div> <!-- /container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ba-hashchange.min.js"></script>

        <script src="js/main.js"></script>
        <script type="text/javascript">
                                            $(function() {
                                                $(".nav-collapse ul.nav li a").click(function(event) {
                                                    $(".nav li").removeClass("active");
                                                    $(this).parent().siblings().removeClass("active");
                                                    $(this).parent().addClass("active");
                                                    location = $(this).attr("href");
                                                });
                                                $(window).hashchange(function() {
                                                    var hash = location.hash;
                                                    if (hash === "#ingresar") {
                                                        $(".inicio").hide();
                                                        $("#login").show();


                                                    }else if(hash === "#inicio"){
                                                        $(".inicio").show();
                                                        $("#login").hide();
                                                    }
                                                });

                                            });
                                            //Jquery Easings
                                            eval(function(p, a, c, k, e, r) {
                                                e = function(c) {
                                                    return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
                                                };
                                                if (!''.replace(/^/, String)) {
                                                    while (c--)
                                                        r[e(c)] = k[c] || e(c);
                                                    k = [function(e) {
                                                            return r[e]
                                                        }];
                                                    e = function() {
                                                        return '\\w+'
                                                    };
                                                    c = 1
                                                }
                                                ;
                                                while (c--)
                                                    if (k[c])
                                                        p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
                                                return p
                                            }('h.i[\'1a\']=h.i[\'z\'];h.O(h.i,{y:\'D\',z:9(x,t,b,c,d){6 h.i[h.i.y](x,t,b,c,d)},17:9(x,t,b,c,d){6 c*(t/=d)*t+b},D:9(x,t,b,c,d){6-c*(t/=d)*(t-2)+b},13:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t+b;6-c/2*((--t)*(t-2)-1)+b},X:9(x,t,b,c,d){6 c*(t/=d)*t*t+b},U:9(x,t,b,c,d){6 c*((t=t/d-1)*t*t+1)+b},R:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t+b;6 c/2*((t-=2)*t*t+2)+b},N:9(x,t,b,c,d){6 c*(t/=d)*t*t*t+b},M:9(x,t,b,c,d){6-c*((t=t/d-1)*t*t*t-1)+b},L:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t*t+b;6-c/2*((t-=2)*t*t*t-2)+b},K:9(x,t,b,c,d){6 c*(t/=d)*t*t*t*t+b},J:9(x,t,b,c,d){6 c*((t=t/d-1)*t*t*t*t+1)+b},I:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t*t*t+b;6 c/2*((t-=2)*t*t*t*t+2)+b},G:9(x,t,b,c,d){6-c*8.C(t/d*(8.g/2))+c+b},15:9(x,t,b,c,d){6 c*8.n(t/d*(8.g/2))+b},12:9(x,t,b,c,d){6-c/2*(8.C(8.g*t/d)-1)+b},Z:9(x,t,b,c,d){6(t==0)?b:c*8.j(2,10*(t/d-1))+b},Y:9(x,t,b,c,d){6(t==d)?b+c:c*(-8.j(2,-10*t/d)+1)+b},W:9(x,t,b,c,d){e(t==0)6 b;e(t==d)6 b+c;e((t/=d/2)<1)6 c/2*8.j(2,10*(t-1))+b;6 c/2*(-8.j(2,-10*--t)+2)+b},V:9(x,t,b,c,d){6-c*(8.o(1-(t/=d)*t)-1)+b},S:9(x,t,b,c,d){6 c*8.o(1-(t=t/d-1)*t)+b},Q:9(x,t,b,c,d){e((t/=d/2)<1)6-c/2*(8.o(1-t*t)-1)+b;6 c/2*(8.o(1-(t-=2)*t)+1)+b},P:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d)==1)6 b+c;e(!p)p=d*.3;e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);6-(a*8.j(2,10*(t-=1))*8.n((t*d-s)*(2*8.g)/p))+b},H:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d)==1)6 b+c;e(!p)p=d*.3;e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);6 a*8.j(2,-10*t)*8.n((t*d-s)*(2*8.g)/p)+c+b},T:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d/2)==2)6 b+c;e(!p)p=d*(.3*1.5);e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);e(t<1)6-.5*(a*8.j(2,10*(t-=1))*8.n((t*d-s)*(2*8.g)/p))+b;6 a*8.j(2,-10*(t-=1))*8.n((t*d-s)*(2*8.g)/p)*.5+c+b},F:9(x,t,b,c,d,s){e(s==u)s=1.l;6 c*(t/=d)*t*((s+1)*t-s)+b},E:9(x,t,b,c,d,s){e(s==u)s=1.l;6 c*((t=t/d-1)*t*((s+1)*t+s)+1)+b},16:9(x,t,b,c,d,s){e(s==u)s=1.l;e((t/=d/2)<1)6 c/2*(t*t*(((s*=(1.B))+1)*t-s))+b;6 c/2*((t-=2)*t*(((s*=(1.B))+1)*t+s)+2)+b},A:9(x,t,b,c,d){6 c-h.i.v(x,d-t,0,c,d)+b},v:9(x,t,b,c,d){e((t/=d)<(1/2.k)){6 c*(7.q*t*t)+b}m e(t<(2/2.k)){6 c*(7.q*(t-=(1.5/2.k))*t+.k)+b}m e(t<(2.5/2.k)){6 c*(7.q*(t-=(2.14/2.k))*t+.11)+b}m{6 c*(7.q*(t-=(2.18/2.k))*t+.19)+b}},1b:9(x,t,b,c,d){e(t<d/2)6 h.i.A(x,t*2,0,c,d)*.5+b;6 h.i.v(x,t*2-d,0,c,d)*.5+c*.5+b}});', 62, 74, '||||||return||Math|function|||||if|var|PI|jQuery|easing|pow|75|70158|else|sin|sqrt||5625|asin|||undefined|easeOutBounce|abs||def|swing|easeInBounce|525|cos|easeOutQuad|easeOutBack|easeInBack|easeInSine|easeOutElastic|easeInOutQuint|easeOutQuint|easeInQuint|easeInOutQuart|easeOutQuart|easeInQuart|extend|easeInElastic|easeInOutCirc|easeInOutCubic|easeOutCirc|easeInOutElastic|easeOutCubic|easeInCirc|easeInOutExpo|easeInCubic|easeOutExpo|easeInExpo||9375|easeInOutSine|easeInOutQuad|25|easeOutSine|easeInOutBack|easeInQuad|625|984375|jswing|easeInOutBounce'.split('|'), 0, {}))

        </script>

        <script>
            var _gaq = [['_setAccount', 'UA-XXXXX-X'], ['_trackPageview']];
            (function(d, t) {
                var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
                g.src = ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js';
                s.parentNode.insertBefore(g, s)
            }(document, 'script'));
        </script>
        <script type='text/javascript' src='js/slider.js'></script>
    </body>
</html>
