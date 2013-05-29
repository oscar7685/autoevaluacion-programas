<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" media="print">
<script type="text/javascript">
    $(function() {
        marcacion = new Date()
        Hora = marcacion.getHours()
        Minutos = marcacion.getMinutes()
        Segundos = marcacion.getSeconds()
        if (Hora <= 9)
            Hora = "0" + Hora
        if (Minutos <= 9)
            Minutos = "0" + Minutos
        if (Segundos <= 9)
            Segundos = "0" + Segundos
        var Dia = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
        var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        var Hoy = new Date();
        var Anio = Hoy.getFullYear();
        var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
        $("#hora").html(" " + Fecha);


        $("button[rel=popover2]")
                .popover({placement: 'left'}).click(function(e) {
            e.preventDefault();

            $(this).popover('hide');

            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=generarMuestraAleatoria",
                data: $("#formGenearAleatorio").serialize(),
                success: function(data) {
                    $("#listM").empty();
                    $.ajax({
                        type: 'POST',
                        url: "/sap/controladorCP?action=selectorListMuestra",
                        data: $("#formListarMuestra").serialize(),
                        success: function(datos) {
                            $("#listM").append(datos);
                            $("#contenido").show(200, function() {
                                $(".page_loading").hide();
                            });
                        } //fin success
                    }); //fin $.ajax    
                }
            });

        });

        $("#bpreparedEditarMuestra").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=preparedEditarMuestra",
                success: function(datos) {
                    $("#editM").empty();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });
                } //fin success
            }); //fin $.ajax    

        });

        $("#printEnlace").click(function() {
            $('#printMuestra').printArea();
            return false;
        });

        $("#actEnlace").click(function() {
            marcacion = new Date()
            Hora = marcacion.getHours()
            Minutos = marcacion.getMinutes()
            Segundos = marcacion.getSeconds()
            if (Hora <= 9)
                Hora = "0" + Hora
            if (Minutos <= 9)
                Minutos = "0" + Minutos
            if (Segundos <= 9)
                Segundos = "0" + Segundos
            var Dia = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
            var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
            var Hoy = new Date();
            var Anio = Hoy.getFullYear();
            var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
            $("#hora").html(" " + Fecha);

            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=selectorListSemestre",
                data: $("#formListarMuestra").serialize(),
                success: function(datos) {
                    $("#listM").empty();
                    $("#listM").append(datos);
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });
                } //fin success
            }); //fin $.ajax   
        });

    });
</script>
<c:if test="${selectorFuente != 'Estudiante'}">
    <div class="input-append span10 input-prepend" style="text-align: right; margin-left: 0px;">
        <form id="formGenearAleatorio">
            <span class="add-on">#</span><input name="numero" type="text" size="1" id="appendedInputButtons" class="span1"><button id="generarAltIndi" type="button" class="btn" data-content="<p style='text-align: justify'>Genera y añade a la muestra listada el número especificado de usuarios aleatorios en la caja de texto. Esta operación no se podrá deshacer.<p>" rel="popover2"  value="1" data-original-title="Generar usuarios aleatorios">Generar usuarios aleatorio</button>
        </form>
    </div>
</c:if>
<a class="span9" style="text-align: right; margin-left: 30px; text-align: right; cursor: pointer" id="actEnlace"><i class="icon-refresh"></i> Actualizar</a>  
<a  class="span1" style="text-align: right; margin-left: 0px; text-align: right; cursor: pointer" id="printEnlace"><i class="icon-print"></i> Imprimir</a>  
<div id="printMuestra">
    <p style="font-weight: bold">Muestra generada para la fuente ${Fuente.nombre}. ${Programa.getNombre()}</p>
    <div>
        <div style="margin-left: 0px;" class="span1"><span style="margin-left: 0px;" id="spanActualizado" class="label label-info span1">Actualizado</span></div>
        <div class="span9"><p id="hora" class="help-block"></p></div>
    </div>
    <div id="listM2" class="span10" style="margin-left: 0px;">
        <div class="span10" style="margin-left: 0px;">
            <c:choose>
                <c:when test="${fn:length(listMuestraSeleccionada)!= 0}">
                    <c:if test="${EstadoProceso == 2}">
                        <div>
                            <span class="label label-success" style="background-color: #F2DEDE;
                                  border-color: #EED3D7;
                                  color: #B94A48;">Pendiente</span>
                            <span class="label label-success" style="background-color: #DFF0D8;
                                  border-color: #D6E9C6;
                                  color: #468847;">Terminado</span>
                            <span class="label label-success" style="background-color: #D9EDF7;
                                  border-color: #BCE8F1;
                                  color: #3A87AD; margin-bottom: 5px">Guardado</span>
                        </div>
                        <br>
                    </c:if>
                    <div id="editM">
                        <table class="table table-striped table-bordered table-condensed">
                            <thead>
                            <th>Cedula</th>    
                            <th>Nombre</th>
                            <th>Apellido</th>
                            </thead>
                            <tbody>
                                <c:if test="${EstadoProceso == 2}">
                                    <c:forEach items="${listMuestraSeleccionada}" var="row" varStatus="iter">
                                        <tr>
                                            <td style="background-color: #F2DEDE">   
                                                <c:out value="${row.muestrapersonaId.cedula}"/>
                                            </td>
                                            <td style="background-color: #F2DEDE">   
                                                <c:out value="${row.muestrapersonaId.nombre}"/>
                                            </td>
                                            <td style="background-color: #F2DEDE">   
                                                <c:out value="${row.muestrapersonaId.apellido}"/>
                                            </td>
                                        </tr>
                                        <c:set var="contador" value="${iter.index}"></c:set>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${EstadoProceso != 2}">
                                    <c:forEach items="${listMuestraSeleccionada}" var="row" varStatus="iter">
                                        <tr>
                                            <td>   
                                                <c:out value="${row.muestrapersonaId.cedula}"/>
                                            </td>
                                            <td>   
                                                <c:out value="${row.muestrapersonaId.nombre}"/>
                                            </td>
                                            <td>   
                                                <c:out value="${row.muestrapersonaId.apellido}"/>
                                            </td>
                                        </tr>
                                        <c:set var="contador" value="${iter.index}"></c:set>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                        <p style="font-weight: bold">Total Estudiantes: ${contador + 1}</p>
                        <c:if test="${selectorFuente != 'Docente' && selectorFuente != 'Estudiante' }">
                            <a href="#preparedEvaluador" class="btn btn-large btn-primary llamador"><i class="icon-plus"> </i><i class="icon-user"></i> Registrar Evaluador</a>
                        </c:if>
                        <c:if test="${selectorFuente == 'Estudiante' && Semestre != '--'}">
                            <a id="bpreparedEditarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                        </c:if>
                    </div>
                </c:when>
                <c:otherwise>
                    No  se ha generado la muestra para la fuente seleccionada.
                    <br><br>
                    <c:if test="${selectorFuente != 'Docente' && selectorFuente != 'Estudiante' }">
                        <a href="#preparedEvaluador" class="btn btn-large btn-primary llamador"><i class="icon-plus"> </i><i class="icon-user"></i> Registrar Evaluador</a>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>