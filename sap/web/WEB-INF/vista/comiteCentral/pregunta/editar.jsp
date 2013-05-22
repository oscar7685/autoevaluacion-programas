<script type="text/javascript">
    $(function() {
        $("#formEditarPregunta").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCC?action=editarPregunta",
                    data: $("#formEditarPregunta").serialize(),
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
            <form id="formEditarPregunta" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar Pregunta</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value="${pregunta.codigo}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Pregunta</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" class="input-xlarge {required:true}" value="${pregunta.pregunta}"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Guardar cambios</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>