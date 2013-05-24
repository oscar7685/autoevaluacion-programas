<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        $("#selectListMuestra").change(function() {
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

        });


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
            })

        });
    });
</script>
<div class="input-append span10 input-prepend" style="text-align: right; margin-left: 0px;">
    <form id="formGenearAleatorio">
        <span class="add-on">#</span><input name="numero" type="text" size="1" id="appendedInputButtons" class="span1"><button id="generarAltIndi" type="button" class="btn" data-content="<p style='text-align: justify'>Genera y añade a la muestra listada el número especificado de usuarios aleatorios en la caja de texto. Esta operación no se podrá deshacer.<p>" rel="popover2"  value="1" data-original-title="Generar usuarios aleatorios">Generar usuarios aleatorio</button>
    </form>
</div>
<div class="span10" style="margin-left: 0px;">
    <c:choose>
        <c:when test="${fn:length(listMuestraSeleccionada)!= 0}">
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <th>Cedula</th>    
                <th>Nombre</th>
                </thead>
                <tbody>
                    <c:forEach items="${listMuestraSeleccionada}" var="row" varStatus="iter">
                        <tr>
                            <td>   
                                <c:out value="${row.cedula}"/>
                            </td>
                            <td>   
                                <c:out value="${row.nombre}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="#preparedEvaluador" class="btn btn-large btn-primary llamador"><i class="icon-plus"> </i><i class="icon-user"></i> Registrar Evaluador</a>
        </c:when>
        <c:otherwise>
            No  se ha generado la muestra para la fuente seleccionada.
            <br><br>
            <a href="#preparedEvaluador" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i><i class="icon-user"></i> Registrar Evaluador</a>
        </c:otherwise>
    </c:choose>
</div>