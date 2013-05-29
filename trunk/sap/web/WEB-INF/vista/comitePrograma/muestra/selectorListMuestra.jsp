<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        /*$("#selectListMuestra").change(function() {
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
         
         });*/

     

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

    });
</script>
<c:if test="${selectorFuente != 'Estudiante'}">
    <div class="input-append span10 input-prepend" style="text-align: right; margin-left: 0px;">
        <form id="formGenearAleatorio">
            <span class="add-on">#</span><input name="numero" type="text" size="1" id="appendedInputButtons" class="span1"><button id="generarAltIndi" type="button" class="btn" data-content="<p style='text-align: justify'>Genera y a�ade a la muestra listada el n�mero especificado de usuarios aleatorios en la caja de texto. Esta operaci�n no se podr� deshacer.<p>" rel="popover2"  value="1" data-original-title="Generar usuarios aleatorios">Generar usuarios aleatorio</button>
        </form>
    </div>
</c:if>
<div id="listM2" class="span10" style="margin-left: 0px;">
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