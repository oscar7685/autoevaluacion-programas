<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout2.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/otro.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/docs.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css">
        <script src="<%=request.getContextPath()%>/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <div class="ui-layout-north ui-widget-content">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <a href="index.html" class="brand">SAP - ${Programa.getNombre()}</a>
                        <div class="nav-collapse collapse">
                            <ul class="nav barra" >
                                <li class="active"><a href="#inicio"><i class="icon-home"></i> Inicio</a></li>
                                <li><a href="#"><i class="icon-phone"></i> Contacto</a></li>
                                <li ><a href="#"><i class="icon-info-sign"></i> Acerca de</a></li>
                                <li class="dropdown loggining"> 
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                        <i class="icon-user"></i> ${nombre}
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Perfil</a></li>
                                        <li><a href="#">Cambiar Contrase&ntilde;a</a></li>
                                        <li class="divider"></li>
                                        <li><a href="<%=request.getContextPath()%>/#CerrarSesion">Cerrar Sesion</a></li>
                                    </ul>

                                </li>
                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </div>
            </div>        

        </div><!--North-->

        <div class="ui-layout-south ui-widget-content"> 
            <footer id="footer" class="contenedor_footer fondo_footer">
                <div class="links">
                    <a style="font-weight: normal;-moz-text-decoration-line: none;"><span class="muted">&copy; Universidad de Cartagena 2013</span></a>

                    <a class="about" href="#"><span>Acerca de</span></a>

                    <a href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto" target="_blank"><span>Contacto</span></a>

                    <a href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto" target="_blank"><span>Ayuda</span></a>
                </div>
            </footer>
        </div><!--South--><!--South-->

        <div class="ui-layout-center">

        </div><!--/Center-->

        <div id="ui-layout-west" class="ui-layout-west">
            <div id="menu0" class="ui-layout-content">
                <c:choose>
                    <c:when test="${EstadoProceso == 0}">
                        <div  align="center" class="alert alert-block">
                            <i class="icon-info-sign"></i> No existen proceso activos
                        </div>
                        <div id="menu" style="padding: 8px 0pt;" class="well">

                            <ul class="nav nav-list">  
                                <button id="west-closer" class="close">&laquo;</button>
                                <li class="nav-header">Proceso de Atoevaluación</li>
                                <li><a href="#preparedCrearProceso"><i class="icon-plus"></i> Crear Proceso</a></li>
                                <li><a href="#listarProceso"><i class="icon-reorder"></i> Listar Procesos</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:when test="${EstadoProceso == 1}">
                        <div align="center" class="alert alert-info"><i class="icon-cog"></i> Proceso en configuración</div>
                        <div id="menu" style="padding: 8px 0pt;" class="well">
                            <ul class="nav nav-list">  
                                <button id="west-closer" class="close">&laquo;</button>
                                <li class="nav-header">Proceso de Atoevaluación</li>
                                <li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>
                                <li><a href="#listPonderacionFactor"><i class="icon-list-ol"></i> Ponderar Factores</a></li>
                                <li><a href="#listPonderacionCara"><i class="icon-list-ol"></i> Ponderar Características</a></li>
                                <li><a href="#listMuestra"><i class="icon-group"></i> Asignar Muestra</a></li>
                                <li class="divider"></li>
                                <li><a href="#iniciarProceso"><i class="icon-play-sign"></i> Iniciar proceso</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:when test="${EstadoProceso == 2}">
                        <div align="center" class="alert alert-success"><i class="icon-play-sign"></i> Proceso en ejecución</div>
                        <div id="menu" style="padding: 8px 0pt;" class="well">
                            <ul class="nav nav-list">  
                                <button id="west-closer" class="close">&laquo;</button>
                                <li class="nav-header">Proceso de Atoevaluación</li>
                                <li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>
                                <li><a href="#listPonderacionFactor"><i class="icon-list-ol"></i> Factores</a></li>
                                <li><a href="#listPonderacionCara"><i class="icon-list-ol"></i> Características</a></li>
                                <li><a href="#listMuestra"><i class="icon-group"></i> Muestra Asignada</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </div>
            <div align="center" style="bottom: 0px; position: absolute; margin-left: 10px">
                <a title="Autoevaluación Institucional" href="http://autoevaluacioninstitucional.unicartagena.edu.co/" target="_blank">
                    <img src="<%=request.getContextPath()%>/img/LogoU.png" style="width: 220px;"></img>
                </a>
            </div>
        </div><!--/West-->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="<%=request.getContextPath()%>/js/jquery.layout-latest.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.metadata.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.PrintArea.js"></script>
        <script src="<%=request.getContextPath()%>/js/vendor/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ba-hashchange.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/main1.js"></script>


        <div class="modal hide fade" id="modalCp1">
            <div class="modal-header">
                <a data-dismiss="modal" class="close">×</a>
                <h3>Atención!</h3>
            </div>
            <div class="modal-body">
                <h4>Iniciar Proceso de Autoevaluación.</h4>
                <br>
                <p style="text-align: justify">Esta seguro que desea ejecutar el Proceso?. Tenga en cuenta que sólo la asignación de muestra para la fuente estudiante será editable al ejecutar el proceso. Los demás parámetros no podrán ser modificados.</p>
            </div>
            <div class="modal-footer">
                <a id="modalCpb2" class="btn btn-secundary" data-dismiss="modal" href="#">Cancelar</a>
                <a id="modalCpb1" class="btn btn-primary" data-dismiss="modal" href="#">Iniciar Proceso</a>
            </div>
        </div>
        <div class="modal hide fade" id="modalCp2">
            <div class="modal-header">
                <a data-dismiss="modal" class="close">×</a>
                <h3>Atención!</h3>
            </div>
            <div class="modal-body">
                <h4>Iniciar Proceso de Autoevaluación Institucional.</h4>
                <br>
                <p>Debe configurar todo el proceso para continuar.</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" data-dismiss="modal" href="#">Cerrar</a>
            </div>
        </div>
    </body>
</html>

