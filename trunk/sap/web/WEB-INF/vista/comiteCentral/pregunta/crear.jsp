<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
        $("#formCrearPregunta").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCC?action=crearPregunta",
                    data: $("#formCrearPregunta").serialize(),
                    success: function() {
                        location = "/sap/#listarPreguntas";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formCrearPregunta" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear Pregunta</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Pregunta</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="tipo" class="control-label">Tipo de la Pregunta</label>
                        <div class="controls">
                            <select name="tipo" id="tipo">
                                <option value="1">Elegir del 1 al 5</a></option>
                                <option value="2">Si/No</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="indicador" class="control-label">Asignar Indicador</label>
                        <div class="controls">
                            <select id="indicador" name="indicador" class="span">
                                <option></option>
                                <c:forEach items="${listaI}" var="row" varStatus="iter">
                                    <option data-content="${row.nombre}" rel="popover2" data-original-title="Indicador" value="${row.id}">${row.codigo}</option>
                                </c:forEach>
                            </select>                

                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear Pregunta</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>