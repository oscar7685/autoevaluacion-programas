<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
        $("#formInfoNum").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=registrarInfoNumerica",
                    data: $("#formInfoNum").serialize(),
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
            <form id="formInfoNum" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Evaluar información numérica</legend>
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
                                            <c:when test="${itemN.instrumentoId.id=='2'}">
                                                <tr>
                                                    <td>${itemN.indicadorId.codigo}</td>
                                                    <td>${itemN.indicadorId.nombre}</td>
                                                    <td>${itemN.documento}</td>
                                                    <td>${itemN.responsable}</td>
                                                    <td>${itemN.medio}</td>
                                                    <td>${itemN.lugar}</td>
                                                    <td>${itemN.evaluacion}</td>
                                                    <td>${itemN.accion}</td>
                                                </tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${lisrInidicadorsNum}" var="item" varStatus="iter">
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
                                                    <option selected="selected" value="1">1</option>
                                                    <option value="2">2</option>
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
                        <button class="btn btn-primary" type="submit">Registrar información numérica</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>    

