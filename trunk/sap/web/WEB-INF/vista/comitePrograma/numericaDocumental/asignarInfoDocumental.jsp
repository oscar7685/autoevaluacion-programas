<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    $(this).parents('tr').children("input[name=^'InfoCambio']").attr("value", "1");
                }
            });
        });

        $("#actualiza").click(function() {
            $(this).button('loading');
            $("#formInfoDoc").submit();

        });

        $("#formInfoDoc").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=registrarInfoDocumental",
                    data: $("#formInfoDoc").serialize(),
                    success: function() {

                        // location = "/sap/#listPonderacionCara";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formInfoDoc" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Evaluar información documental</legend>
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <th>C&oacute;digo</th>
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
                            <c:choose>
                                <c:when test="${fn:length(listaNumDoc)!= 0}">
                                    <c:forEach items="${listaNumDoc}" var="itemN" varStatus="iterN">
                                        <c:choose>
                                            <c:when test="${itemN.instrumentoId.id=='3'}">

                                                <tr>
                                                    <td>${itemN.indicadorId.codigo}</td>
                                                    <td style="text-align: justify;">${itemN.indicadorId.nombre}</td>
                                                    <td>
                                                        <textarea name="nombreDocumento${itemN.id}" rows="4" class="span2" placeholder="Documento asociado">${itemN.documento}</textarea>
                                                    </td>
                                                    <td>
                                                        <textarea name="responsableDocumento${itemN.id}" rows="4" class="span2" placeholder="Responsable">${itemN.responsable}</textarea>
                                                    </td>
                                                    <td>
                                                        <textarea name="medioDocumento${itemN.id}" rows="4" class="span1" placeholder="Medio">${itemN.medio}</textarea>
                                                    </td>
                                                    <td>
                                                        <textarea name="lugarDocumento${itemN.id}" rows="4" class="span2" placeholder="Lugar">${itemN.lugar}</textarea>
                                                    </td>
                                                    <td>
                                                        <select class="span1"  name="evaluacionDoc${itemN.id}">
                                                            <c:choose>
                                                                <c:when test="${itemN.evaluacion==1}">
                                                                    <option value="1" selected="selected">1</option>    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="1">1</option>    
                                                                </c:otherwise>    
                                                            </c:choose>
                                                            <c:choose>    
                                                                <c:when test="${itemN.evaluacion==2}">
                                                                    <option value="2" selected="selected">2</option>    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="2">2</option>    
                                                                </c:otherwise>    
                                                            </c:choose>
                                                            <c:choose>    
                                                                <c:when test="${itemN.evaluacion==3}">
                                                                    <option value="3" selected="selected">3</option>    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="3">3</option>    
                                                                </c:otherwise>    
                                                            </c:choose>
                                                            <c:choose>        
                                                                <c:when test="${itemN.evaluacion==4}">
                                                                    <option value="4" selected="selected">4</option>    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="4">4</option>    
                                                                </c:otherwise>  
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${itemN.evaluacion==5}">
                                                                    <option value="5" selected="selected">5</option>    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="5">5</option>    
                                                                </c:otherwise>    
                                                            </c:choose>
                                                        </select>
                                                        <input type="hidden"  value="${itemN.id}" name="idIndicadorDoc${itemN.id}">
                                                    </td>
                                                    <td>
                                                        <textarea name="accionDocumento${itemN.id}" rows="4" class="span2" placeholder="Acci&oacute;n a implementar u observaci&oacute;n">${itemN.accion}</textarea>
                                                    </td>
                                                </tr>


                                            </c:when>
                                        </c:choose>
                                    </c:forEach>

                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${lisrInidicadorsDoc}" var="item" varStatus="iter">
                                        <tr>
                                            <td>${item.codigo}</td>
                                            <td style="text-align: justify;">${item.nombre}</td>
                                            <td>
                                                <textarea name="nombreDocumento${item.id}" rows="4" class="span2" placeholder="Documento asociado">x</textarea>
                                            </td>
                                            <td>
                                                <textarea name="responsableDocumento${item.id}" rows="4" class="span2" placeholder="Responsable">x</textarea>
                                            </td>
                                            <td>
                                                <textarea name="medioDocumento${item.id}" rows="4" class="span1" placeholder="Medio">x</textarea>
                                            </td>
                                            <td>
                                                <textarea name="lugarDocumento${item.id}" rows="4" class="span2" placeholder="Lugar">x</textarea>
                                            </td>
                                            <td>
                                                <select class="span1"  name="evaluacionDoc${item.id}">
                                                    <option value="1">1</option>
                                                    <option selected="selected" value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                                <input type="hidden"  value="${item.id}" name="idIndicadorDoc${item.id}">
                                            </td>
                                            <td>
                                                <textarea name="accionDocumento${item.id}" rows="4" class="span2" placeholder="Acci&oacute;n a implementar u observaci&oacute;n">x</textarea>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>          
                        </tbody>
                    </table>  
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Registrar información documental</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>    

