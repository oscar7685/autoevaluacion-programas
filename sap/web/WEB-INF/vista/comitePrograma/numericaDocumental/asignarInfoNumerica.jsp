<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
        $(".cambiable").each(function() {
            // Save current value of element
            $(this).data('oldVal', $(this).val());

            // Look for changes in the value
            $(this).bind("change", function(event) {
                // If value has changed...
                if ($(this).data('oldVal') != $(this).val()) {
                    $(this).parents('tr').children('input[name^=InfoCambio]').attr("value", "1");
                }
            });
        });

        $("#actualiza").click(function() {
            $(this).button('loading');
            $("#formInfoNum").submit();

        });

        $("#formInfoNum").submit(function(event) {
            event.preventDefault();
            $.ajax({
                type: 'POST',
                url: "<%=request.getContextPath()%>/controladorCP?action=registrarInfoNumerica",
                data: $("#formInfoNum").serialize(),
                success: function() {
                    $('#myModalIN').modal();
                    $('#myModalIN').on('hidden', function() {
                        location = "/sap/#listarEvaluarNum";
                    });
                } //fin success
            }); //fin $.ajax
        }); //fin submit
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formInfoNum" class="form-horizontal" method="post" action="">
                <fieldset>
                    <legend>Evaluar información numérica</legend>
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <th>Indicador</th>
                        <th>Documento asociado</th>
                        <th>Responsable</th>
                        <th>Medio</th>
                        <th>Lugar</th>
                        <th>Estado</th>
                        <th>Acci&oacute;n a implementar u observaci&oacute;n</th>
                        </thead>
                        <tbody>
                        <tbody>
                            <c:forEach items="${lisrInidicadorsNum}" var="item" varStatus="iter">
                                <c:set var="encontrado" value="false"></c:set>
                                <c:forEach items="${listaNum}" var="itemNC" varStatus="iterNC"> 
                                    <c:choose>
                                        <c:when test="${itemNC.indicadorId.id==item.id}">
                                            <c:set var="encontrado" value="true"></c:set>
                                                <tr>
                                            <input type="hidden" name="InfoCambio${item.id}" value="0">    
                                        <td style="text-align: justify;">${item.codigo} ${item.nombre}</td>
                                        <td>
                                            <textarea name="nombreDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Documento asociado">${itemNC.documento}</textarea>
                                        </td>
                                        <td>
                                            <textarea name="responsableDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Responsable">${itemNC.responsable}</textarea>
                                        </td>
                                        <td>
                                            <textarea name="medioDocumento${item.id}" rows="4" class="cambiable span1" placeholder="Medio">${itemNC.medio}</textarea>
                                        </td>
                                        <td>
                                            <textarea name="lugarDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Lugar">${itemNC.lugar}</textarea>
                                        </td>
                                        <td>
                                            <select class="cambiable span1"  name="evaluacionNum${item.id}">
                                                <c:choose>
                                                    <c:when test="${itemNC.evaluacion == 1}">
                                                        <option selected="selected" value="1">1</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1">1</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${itemNC.evaluacion == 2}">
                                                        <option selected="selected" value="2">2</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="2">2</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${itemNC.evaluacion == 3}">
                                                        <option selected="selected" value="3">3</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="3">3</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${itemNC.evaluacion == 4}">
                                                        <option selected="selected" value="4">4</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="4">4</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${itemNC.evaluacion == 5}">
                                                        <option selected="selected" value="5">5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="5">5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                            <input type="hidden"  value="${itemNC.id}" name="idNumDoc${item.id}">
                                        </td>
                                        <td>
                                            <textarea name="accionDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Acci&oacute;n a implementar u observaci&oacute;n">${itemNC.accion}</textarea>
                                        </td>
                                        </tr> 
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${encontrado==false}">
                                    <tr>
                                    <input type="hidden" name="InfoCambio${item.id}" value="0">
                                    <td style="text-align: justify;">${item.codigo} ${item.nombre}</td>
                                    <td>
                                        <textarea name="nombreDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Documento asociado"></textarea>
                                    </td>
                                    <td>
                                        <textarea name="responsableDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Responsable"></textarea>
                                    </td>
                                    <td>
                                        <textarea name="medioDocumento${item.id}" rows="4" class="cambiable span1" placeholder="Medio"></textarea>
                                    </td>
                                    <td>
                                        <textarea name="lugarDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Lugar"></textarea>
                                    </td>
                                    <td>
                                        <select class="cambiable span1"  name="evaluacionNum${item.id}">
                                            <option selected="selected" value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                        <input type="hidden"  value="${item.id}" name="idIndicadorNum${item.id}">
                                    </td>
                                    <td>
                                        <textarea name="accionDocumento${item.id}" rows="4" class="cambiable span2" placeholder="Acci&oacute;n a implementar u observaci&oacute;n"></textarea>
                                    </td>
                                    </tr>
                                </c:when>
                            </c:choose>            
                        </c:forEach>                
                        </tbody>
                    </table>  
                    <div class="form-actions">
                        <button class="btn btn-primary" type="button" id="actualiza" data-original-title="Registrar información numérica"  data-loading-text="Guardando..." autocomplete="off">Registrar informaci&oacute;n num&eacute;rica</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>