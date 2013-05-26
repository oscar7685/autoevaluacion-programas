<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/dragDrop/selector.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dragDrop/selector.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $.fcbkListSelection("#fcbklist", "1000", "50", "6");

        $("#botonActualizarMuestra").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=editarMuestra",
                data: $("#formEditarMuestra").serialize(),
                success: function(datos) {
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
                } //fin success
            }); //fin $.ajax    

        });
    });
</script>
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
<form id="formEditarMuestra">
    <ul id="fcbklist">
        <c:forEach items="${listPoblacion}" var="item" varStatus="iter">
            <c:set var="auxx" value="1"></c:set>
            <c:forEach items="${listMuestraSeleccionada}" var="item2" varStatus="iter2">
                <c:if test="${item.personaId.id == item2.cedula}">
                    <c:set var="varaux" value="0"/>
                    <c:forEach items="${listEncabezado}" var="item3" varStatus="iter2">
                        <c:if test="${item.personaId.id == item3.personaId.id}">
                            <c:set var="varaux" value="1"/>
                            <c:if test="${item3.estado == 'terminado'}">
                                <li id="itemblockVerde">
                                    <c:set var="auxx" value="0"></c:set>
                                    <strong>${item.personaId.nombre} ${item.personaId.apellido}</strong><br/> 
                                    <span class="fcbkitem_text">${item.personaId.id}</span>
                                    <input id="itemblockinput" name="${item.personaId.id}" type="hidden" checked="checked" value="0"/>
                                </li>
                            </c:if>
                            <c:if test="${item3.estado == 'guardada'}">
                                <li id="itemblockAzul">
                                    <c:set var="auxx" value="0"></c:set>
                                    <strong>${item.personaId.nombre} ${item.personaId.apellido}</strong><br/> 
                                    <span class="fcbkitem_text">${item.personaId.id}</span>
                                    <input name="${item.personaId.id}" type="hidden" checked="checked" value="0"/>
                                </li>
                            </c:if>                   
                        </c:if>
                    </c:forEach>
                    <c:if test="${varaux == 0}">
                        <li id="itemblockRojo">
                            <c:set var="auxx" value="0"></c:set>
                            <strong>${item.personaId.nombre} ${item.personaId.apellido}</strong><br/> 
                            <span class="fcbkitem_text">${item.personaId.id}</span>
                            <input name="${item.personaId.id}" type="hidden" checked="checked" value="0"/>
                        </li>
                    </c:if>
                </c:if>
            </c:forEach>
            <c:if test="${auxx == 1}">
                <li>
                    <c:set var="auxx" value="0"></c:set>
                    <strong>${item.personaId.nombre} ${item.personaId.apellido}</strong><br/> 
                    <span class="fcbkitem_text">${item.personaId.id}</span>
                    <input name="${item.personaId.id}" type="hidden" value="0"/>
                </li>
            </c:if>
        </c:forEach> 

    </ul>
    <div class="form-actions">
        <button class="btn btn-primary" id="botonActualizarMuestra" type="button">Actualizar Muestra Para Fuente Seleccionada</button>
        <button class="btn btn-secundary" id="botonCancelar" type="button">Cancelar</button>
    </div>
</form>