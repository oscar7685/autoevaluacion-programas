<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
        $("#formInfoDoc").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=registrarInfoDocumental",
                    data: $("#formInfoDoc").serialize(),
                    success: function() {
                        alert("succes");
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

