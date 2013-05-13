<script type="text/javascript">
    $(function() {
        var $fom = $("#formCrearModelo");
        $("form").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/formController2",
                    data: $fom.serialize(),
                    success: function() {
                        location = "/sap/" + $fom.attr("action");
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formCrearModelo" class="form-horizontal" method="post" action="#listarModelo">
                <fieldset>
                    <legend>Crear Modelo</legend>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Modelo</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="descripcion" class="control-label">Descripci&oacute;n</label>
                        <div class="controls">
                            <textarea rows="3" name="descripcion" id="descripcion" class="input-xxlarge {required:true}"></textarea>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear Modelo</button>
                        <button class="btn" type="reset">Cancelar</button>
                        <input type="hidden" name="action" value="crearModeloCC">
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>