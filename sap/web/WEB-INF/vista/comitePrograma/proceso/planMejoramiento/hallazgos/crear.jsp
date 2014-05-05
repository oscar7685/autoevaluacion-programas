<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('#fechaI').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#fechaF').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $("#formCrearHallazgo").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=crearHallazgo2",
                    data: $("#formCrearHallazgo").serialize(),
                    success: function() {
                        location = "/sap/#listarHallazgos";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li><a href="<%=request.getContextPath()%>/#planMejoramiento">Plan de mejoramiento</a> <span class="divider">/</span></li>
                <li><a href="<%=request.getContextPath()%>/#listarProyectosE">Proyectos estratégicos</a> <span class="divider">/</span></li>
                <li><a href="<%=request.getContextPath()%>/#editarPEstrategico&${hallazgo.proyectoestrategicoIdproyectoestrategico.idproyectoestrategico}" data-placement="left" rel="tooltip" data-original-title="${hallazgo.proyectoestrategicoIdproyectoestrategico.proyecto}" class="tool">Proyecto</a><span class="divider">/</span></li>
                <li><a href="<%=request.getContextPath()%>/#verProyectoEstrategico&${hallazgo.proyectoestrategicoIdproyectoestrategico.idproyectoestrategico}">Hallazgos</a> <span class="divider">/</span></li>
                <li class="active">Crear</li>
            </ul>    
            <form id="formCrearHallazgo" class="form" method="post">
                <fieldset>
                    <legend>Crear hallazgo</legend>
                    <div class="span4">
                        <div class="control-group">
                            <label for="hallazgo" class="control-label">Hallazgo</label>
                            <div class="controls">
                                <textarea rows="4" name="hallazgo" id="hallazgo" class="span4 {required:true}"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="estrategia" class="control-label">Estrategias</label>
                            <div class="controls">
                                <textarea rows="4" name="estrategia" id="estrategia" class="span4 {required:true}"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="metas" class="control-label">Metas</label>
                            <div class="controls">
                                <textarea rows="4" name="metas" id="metas" class="span4 {required:true}"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="indicador" class="control-label">Indicadores de cumplimiento</label>
                            <div class="controls">
                                <textarea rows="4" name="indicador" id="indicador" class="span4 {required:true}"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="responsable" class="control-label">Responsable(s)</label>
                            <div class="controls">
                                <textarea rows="4" name="responsable" id="responsable" class="span4 {required:true}"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="financiacion" class="control-label">Financiación</label>
                            <div class="controls">
                                <textarea rows="4" name="financiacion" id="financiacion" class="span4 {required:true}"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="fechaI" class="control-label">Fecha inicio</label>
                            <div class="controls">
                                <input type="text" name="fechaI" id="fechaI" class="span4 {required:true}"/>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="fechaF" class="control-label">Fecha final</label>
                            <div class="controls">
                                <input type="text" name="fechaF" id="fechaF" class="span4 {required:true}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions span8">
                        <button class="btn btn-primary" type="submit">Crear Hallazgo</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>