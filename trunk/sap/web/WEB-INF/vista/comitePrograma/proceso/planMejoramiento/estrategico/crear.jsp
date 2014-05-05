<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $("#formCrearProyectoEst").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=crearProyectoEst",
                    data: $("#formCrearProyectoEst").serialize(),
                    success: function() {
                        location = "/sap/#listarProyectosE";
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
                <li class="active">Crear</li>
            </ul>
            <form id="formCrearProyectoEst" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear proyecto estrat&eacute;gico</legend>
                    <div class="control-group">
                        <label for="proyecto" class="control-label">Proyecto estrat&eacute;gico</label>
                        <div class="controls">
                            <textarea rows="3" name="proyecto" id="proyecto" class="input-xxlarge {required:true}"></textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="objetivo" class="control-label">Objetivo</label>
                        <div class="controls">
                            <textarea rows="6" name="objetivo" id="objetivo" class="input-xxlarge {required:true}"></textarea>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear proyecto estrat&eacute;gico</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>