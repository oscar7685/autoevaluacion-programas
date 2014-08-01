<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" media="print">
<script type="text/javascript">
    $(function() {

        $(".btn-group > .btn").click(function(ev) {
            var boton = $(ev.target);
            if (boton.text() == "Todos") {
                $("tr.terminadoC").show();
                $("tr.pendienteC").show();
                $("tr.guardadoC").show();
            } else {
                if (boton.text() == "Pendiente") {
                    $("tr.terminadoC").hide();
                    $("tr.pendienteC").show();
                    $("tr.guardadoC").hide();
                } else {
                    if (boton.text() == "Terminado") {
                        $("tr.terminadoC").show();
                        $("tr.pendienteC").hide();
                        $("tr.guardadoC").hide();
                    } else {
                        $("tr.terminadoC").hide();
                        $("tr.pendienteC").hide();
                        $("tr.guardadoC").show();
                    }
                }
            }
            $("#total").text("Total: " + ($("tr.terminadoC:visible").length + $("tr.pendienteC:visible").length + $("tr.guardadoC:visible").length));
        });

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
                .popover({trigger: "hover", placement: 'left'}).click(function(e) {
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
                                $("#dancing-dots-text").remove();
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
                        $("#dancing-dots-text").remove();
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
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax   
        });

    });
</script>
<c:if test="${tipoLogin=='Comite central'}">
    <div class="input-append span10 input-prepend" style="text-align: right; margin-left: 0px;">
        <form id="formGenearAleatorio">
            <span class="add-on">#</span><input name="numero" type="text" size="1" id="appendedInputButtons" class="span1"><button id="generarAltIndi" type="button" class="btn" data-content="Genera y añade a la muestra listada el número especificado de usuarios aleatorios en la caja de texto. Esta operación no se podrá deshacer." rel="popover2"  value="1" data-original-title="Generar usuarios aleatorios">Generar usuarios aleatorio</button>
        </form>
    </div>
</c:if>
<c:if test="${EstadoProceso == 2}">
    <div class="span10">
        <a style="float:right; cursor: pointer" id="actEnlace"><i class="icon-refresh"></i> Actualizar</a>  
        <a style="float:right; padding-right: 10px; cursor: pointer" id="printEnlace"><i class="icon-print"></i> Imprimir</a>      
    </div>

</c:if>
<c:if test="${EstadoProceso != 2}">
    <div class="span10">
        <a  style="float: right; cursor: pointer" id="printEnlace"><i class="icon-print"></i> Imprimir</a>  
    </div>

</c:if>
<div id="printMuestra">
    <p style="font-weight: bold">Muestra generada para la fuente ${Fuente.nombre}. ${Programa.getNombre()}</p>
    <c:if test="${EstadoProceso == 2}">
        <div>
            <div style="margin-left: 0px;" class="span1"><span style="margin-left: 0px;" id="spanActualizado" class="label label-info span1">Actualizado</span></div>
            <div class="span9"><p id="hora" class="help-block"></p></div>
        </div>
    </c:if>
    <div id="listM2" class="span10" style="margin-left: 0px;">
        <div class="span10" style="margin-left: 0px;">
            <div id="editM">
                <c:choose>
                    <c:when test="${fn:length(listMuestraSeleccionada)!= 0}">

                        <c:if test="${EstadoProceso == 2}">
                            <div class="btn-group" data-toggle="buttons-radio">
                                <button type="button" class="btn btn-primary active">Todos</button>
                                <button type="button" class="btn btn-danger">Pendiente</button>
                                <button type="button" class="btn btn-success">Terminado</button>
                                <button type="button" class="btn btn-info">Guardado</button>
                            </div>
                            <br><br>
                        </c:if>
                        <table class="table table-striped table-bordered table-condensed">
                            <thead>
                            <th>Cedula</th>    
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Contraseña</th>
                            </thead>
                            <tbody>
                                <c:if test="${EstadoProceso == 2}">

                                    <c:forEach items="${listPoblacion}" var="item" varStatus="iter">

                                        <c:forEach items="${listMuestraSeleccionada}" var="row" varStatus="iter55">


                                            <c:if test="${item.personaId.id == row.muestrapersonaId.cedula}">

                                                <c:set var="varaux" value="0"/>
                                                <c:forEach items="${listEncabezado}" var="item3" >
                                                    <c:if test="${item.personaId.id == item3.muestrapersonaId.cedula}">
                                                        <c:set var="varaux" value="1"/>
                                                        <c:if test="${item3.estado.equals('terminado')}">
                                                            <tr class="terminadoC">
                                                                <td style="background-color: #DFF0D8; color: #468847;">   
                                                                    <c:out value="${row.muestrapersonaId.cedula}"/>
                                                                </td>
                                                                <td style="background-color: #DFF0D8; color: #468847;">   
                                                                    <c:out value="${row.muestrapersonaId.nombre}"/>
                                                                </td>
                                                                <td style="background-color: #DFF0D8; color: #468847;">    
                                                                    <c:out value="${row.muestrapersonaId.apellido}"/>
                                                                </td>
                                                                <td style="background-color: #DFF0D8; color: #468847;">  
                                                                    <c:out value="${row.muestrapersonaId.password}"/>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${item3.estado.equals('guardada')}">
                                                            <tr class="guardadoC">
                                                                <td style="background-color: #D9EDF7; color: #3A87AD;">
                                                                    <c:out value="${row.muestrapersonaId.cedula}"/>
                                                                </td>
                                                                <td style="background-color: #D9EDF7; color: #3A87AD;">
                                                                    <c:out value="${row.muestrapersonaId.nombre}"/>
                                                                </td>
                                                                <td style="background-color: #D9EDF7; color: #3A87AD;">  
                                                                    <c:out value="${row.muestrapersonaId.apellido}"/>
                                                                </td>
                                                                <td style="background-color: #D9EDF7; color: #3A87AD;">
                                                                    <c:out value="${row.muestrapersonaId.password}"/>
                                                                </td>
                                                            </tr>
                                                        </c:if>                   
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${varaux == 0}">
                                                    <tr class="pendienteC">
                                                        <td style="background-color: #F2DEDE; color: #B94A48;">
                                                            <c:out value="${row.muestrapersonaId.cedula}"/>
                                                        </td>
                                                        <td style="background-color: #F2DEDE; color: #B94A48;">
                                                            <c:out value="${row.muestrapersonaId.nombre}"/>
                                                        </td>
                                                        <td style="background-color: #F2DEDE; color: #B94A48;"> 
                                                            <c:out value="${row.muestrapersonaId.apellido}"/>
                                                        </td>
                                                        <td style="background-color: #F2DEDE; color: #B94A48;">
                                                            <c:out value="${row.muestrapersonaId.password}"/>
                                                        </td>
                                                    </tr>

                                                </c:if>
                                            </c:if>
                                            <c:set var="contador" value="${iter55.index}"></c:set>
                                        </c:forEach>
                                    </c:forEach> 
                                </c:if>
                                <c:if test="${EstadoProceso != 2}">
                                    <c:forEach items="${listMuestraSeleccionada}" var="row" varStatus="iter44">
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
                                            <td>   
                                                <c:out value="${row.muestrapersonaId.password}"/>
                                            </td>
                                        </tr>
                                        <c:set var="contador" value="${iter44.index}"></c:set>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                        <p id="total" style="font-weight: bold">Total: ${contador + 1}</p>
                        <c:if test="${EstadoProceso == 2 && tipoLogin=='Comite central'}">
                            <a id="bpreparedEditarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                        </c:if>

                    </c:when>
                    <c:otherwise>
                        No  se ha generado la muestra para la fuente seleccionada.
                        <c:if test="${EstadoProceso == 2 && tipoLogin=='Comite central'}">
                            <a id="bpreparedEditarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>