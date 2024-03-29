<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        $("#botonGenerarMuestra").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=generarMuestra",
                success: function() {
                    location = "/sap/#listMuestra";
                } //fin success
            }); //fin $.ajax    

        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Asignación de  Muestra</h3>
            <c:choose>
                <c:when test="${Muestra != null}">

                    <a href="#generarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Ponderación</a>
                </c:when>
                <c:otherwise>
                    No  se ha registrado la muestra en el sistema para este proceso.
                    <br><br>
                    <a id="botonGenerarMuestra" href="#generarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Generar Muestra</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    

