<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $("#formEditarProyectoEst").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=EditarProyectoEst",
                    data: $("#formEditarProyectoEst").serialize(),
                    success: function() {
                        location = "/sap/#planMejoramiento";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formEditarProyectoEst" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar proyecto estrat&eacute;gico</legend>
                    <div class="control-group">
                        <label for="proyecto" class="control-label">Proyecto estrat&eacute;gico</label>
                        <div class="controls">
                            <textarea rows="3" name="proyecto" id="proyecto" class="input-xxlarge {required:true}">${proyectoE.proyecto}</textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="objetivo" class="control-label">Objetivo</label>
                        <div class="controls">
                            <textarea rows="6" name="objetivo" id="objetivo" class="input-xxlarge {required:true}">${proyectoE.objetivo}</textarea>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Editar proyecto estrat&eacute;gico</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>