<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
    $(function() {
        $("#formEditPonderarCara").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editPonderarCara",
                    data: $("#formEditPonderarCara").serialize(),
                    success: function() {
                        location = "/sap/#listPonderacionCara";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="nav nav-pills">
                <form id="formEditPonderarCara" class="form-horizontal" method="post">
                    <fieldset>
                        <legend>Ponderación de Característica</legend>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Característica</th>
                                    <th>Nivel de importancia</th>
                                    <th>Ponderacion</th>
                                    <th>Justificacion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listPonderacionCara}" var="row" varStatus="iter">
                                    <tr id="PonderacionCaracteristica${iter.index+1}">    
                                        <td>   
                                            <c:out value="${row.caracteristicaId.codigo}"/>
                                        </td>
                                        <td>   
                                            <c:out value="${row.caracteristicaId.nombre}"/>
                                        </td>
                                        <td>
                                            <input value="${row.nivelimportancia}" name="importancia${row.id}" class="span1 {required:true,number:true}" type="text">
                                        </td>
                                        <td>
                                            <input value="${row.ponderacion}" name="ponderacion${row.id}" class="span1 {required:true,number:true}" type="text">
                                            <input type="hidden"  value="${row.id}" name="id${row.id}">
                                        </td>
                                        <td>
                                            <textarea value="" name="justificacion${row.id}" rows="4" class="span5 {required:true}">${row.justificacion}</textarea>
                                        </td>
                                    </tr>
                                    <c:set var="iterador" value="${iter.index + 1}" />
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" name="count" id="count" value="${iterador}">
                        <div class="form-actions">
                            <button class="btn btn-primary" type="submit">Actualizar Ponderación</button>
                            <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </ul>
        </div><!--/span-->        
    </div><!--/row-->    
</div>