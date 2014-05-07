<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        $("#formEditarHallazgo").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editarHallazgo2",
                    data: $("#formEditarHallazgo").serialize(),
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
                <li class="active">Editar</li>
            </ul>
            <form id="formEditarHallazgo" class="form" method="post">
                <fieldset>
                    <legend>Editar hallazgo</legend>
                    <div class="span4">
                        <div class="control-group">
                            <label for="hallazgo" class="control-label">Hallazgo</label>
                            <div class="controls">
                                <textarea rows="4" name="hallazgo" id="hallazgo" class="span4 {required:true}">${hallazgo.hallazgo}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="estrategia" class="control-label">Estrategias</label>
                            <div class="controls">
                                <textarea rows="4" name="estrategia" id="estrategia" class="span4 {required:true}">${hallazgo.estrategia}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="metas" class="control-label">Metas</label>
                            <div class="controls">
                                <textarea rows="4" name="metas" id="metas" class="span4 {required:true}">${hallazgo.meta}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="indicador" class="control-label">Indicadores de cumplimiento</label>
                            <div class="controls">
                                <textarea rows="4" name="indicador" id="indicador" class="span4 {required:true}">${hallazgo.indicadorCumplimiento}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="responsable" class="control-label">Responsable(s)</label>
                            <div class="controls">
                                <textarea rows="4" name="responsable" id="responsable" class="span4 {required:true}">${hallazgo.responsable}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="financiacion" class="control-label">Financiación</label>
                            <div class="controls">
                                <textarea rows="4" name="financiacion" id="financiacion" class="span4 {required:true}">${hallazgo.financiacion}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="fechaI" class="control-label">Fecha inicio</label>
                            <div class="controls">
                                <input type="text" name="fechaI" id="fechaI" class="span4 {required:true}" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${hallazgo.fechaInicio}'/>"/>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="control-group">
                            <label for="fechaF" class="control-label">Fecha final</label>
                            <div class="controls">
                                <input type="text" name="fechaF" id="fechaF" class="span4 {required:true}" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${hallazgo.fechaFinal}' />"/>
                            </div>
                        </div>
                    </div>
                    <legend>Seguimiento Actividades a realizar</legend>        
                    <div class="span4">
                        <div class="control-group">
                            <label for="estado" class="control-label">Estado</label>
                            <div class="controls">
                                <select name="estado" id="estado" class="span4 {required:true}">
                                    <option>No iniciada</option>
                                    <option>En espera</option>
                                    <option>Cancelada</option>
                                    <option>En ejecución</option>
                                    <option>Finalizada</option>
                                </select>
                            </div>
                        </div>
                    </div>        
                    <div class="form-actions span8">
                        <button class="btn btn-primary" type="submit">Editar Hallazgo</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>