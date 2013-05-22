<script type="text/javascript">
    $(function() {
        $("#formEditarIndicador").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCC?action=editarIndicador",
                    data: $("#formEditarIndicador").serialize(),
                    success: function() {
                        location = "/sap/#listarIndicadores";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formEditarIndicador" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar Indicador</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value="${indicador.codigo}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre" class="control-label">Indicador</label>
                        <div class="controls">
                            <textarea rows="3" name="nombre" id="nombre" class="input-xxlarge {required:true}">${indicador.nombre}</textarea>
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