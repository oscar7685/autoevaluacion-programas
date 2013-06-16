<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(function() {
        $.validator.addMethod('positiveNumber',
                function(value) {
                    return (Number(value) > 0) && (value == parseInt(value, 10));
                }, 'Ingrese un numero entero positivo.');

        $("#formEditarCoordinador").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCC?action=editarCoordinador",
                    data: $("#formEditarCoordinador").serialize(),
                    success: function() {
                        location = "/sap/#listarCoordinadores";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formEditarCoordinador" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar Coordinador</legend>
                    <div class="control-group">
                        <label for="codigo"  class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input disabled="" type="text" name="codigo" id="codigo" class="input-xlarge uneditable-input {required:true, positiveNumber:true}" value="${representante.id}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Nombres</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" class="input-xlarge {required:true}" value="${representante.nombre}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="apellidos"  class="control-label">Apellidos</label>
                        <div class="controls">
                            <input type="text" name="apellidos" id="apellidos" class="input-xlarge {required:true}" value="${representante.apellido}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="clave"  class="control-label">Clave</label>
                        <div class="controls">
                            <input type="text" name="clave" id="clave" class="input-xlarge {required:true}" value="${representante.password}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="correo"  class="control-label">Correo electr&oacute;nico</label>
                        <div class="controls">
                            <input type="text" name="correo" id="correo" class="input-xlarge" value="${representante.mail}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="programa"  class="control-label">Programa</label>
                        <div class="controls">
                            <select name="programa" id="programa" class="input-xlarge {required:true}">
                                <option></option>
                                <c:forEach items="${programas}" var="item">
                                    <c:choose>
                                        <c:when test="${representante.programaId.id == item.id}">
                                            <option value="${item.id}" selected="">${item.nombre}</option>        
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${item.id}">${item.nombre}</option>        
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </select>
                        </div>
                    </div>


                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Editar Coordinador</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>