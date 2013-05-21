<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        $("#selectListMuestra").change(function() {
            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=selectorListMuestra",
                data: $("#formListarMuestra").serialize(),
                success: function(datos) {
                    $("#listM").append(datos);
                    $("#contenido").show(200, function() {
                        $(".page_loading").hide();
                    });
                } //fin success
            }); //fin $.ajax    

        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="nav nav-pills">
                <form id="formListarMuestra" class="" method="post">
                    <fieldset>
                        <legend>Asignación de  Muestra</legend>
                        <div class="control-group">
                            <label for="selectListMuestra"  class="control-label">Fuente: </label>
                            <div class="controls">
                                <select name="fuente" id="selectListMuestra">
                                    <option>Seleccionar Fuente</option>
                                    <option value="Estudiante">Estudiante</option>
                                </select>
                            </div>
                        </div>   
                    </fieldset>
                </form>
            </ul>
            <div id="listM"></div>
        </div>
    </div>
</div>    

