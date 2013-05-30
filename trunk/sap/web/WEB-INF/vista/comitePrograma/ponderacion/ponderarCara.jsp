<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
    $(function() {
        $("#formPonderarCara").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=ponderarCara",
                    data: $("#formPonderarCara").serialize(),
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
                <form id="formPonderarCara" class="form-horizontal" method="post">
                    <fieldset>
                        <legend>Ponderación de Características</legend>
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
                                <c:forEach items="${listCara}" var="row" varStatus="iter">
                                    <tr id="PonderacionCaracteristica${iter.index+1}">    
                                        <td>   
                                            <c:out value="${row.codigo}"/>
                                        </td>
                                        <td>   
                                            <c:out value="${row.nombre}"/>
                                        </td>
                                        <td>
                                            <select class="span1 {required:true}" id="ponderacion${row.id}" name="importancia${row.id}">
                                                <option value=""></option>
                                                <option value="1">1.0</option>
                                                <option value="1.5">1.5</option>
                                                <option value="2">2.0</option>
                                                <option value="2.5">2.5</option>
                                                <option value="3">3.0</option>
                                                <option value="3.5">3.5</option>
                                                <option value="4">4.0</option>
                                                <option value="4.5">4.5</option>
                                                <option value="5">5.0</option>
                                                <option value="5.5">5.5</option>
                                                <option value="6">6.0</option>
                                                <option value="6.5">6.5</option>
                                                <option value="7">7.0</option>
                                                <option value="7.5">7.5</option>
                                                <option value="8">8.0</option>
                                                <option value="8.5">8.5</option>
                                                <option value="9">9.0</option>
                                                <option value="9.5">9.5</option>
                                                <option value="10">10.0</option>
                                            </select>
                                            <input type="hidden"  value="${row.id}" name="id${row.id}">
                                        </td>
                                        <td>
                                            <textarea name="justificacion${row.id}" rows="4" class="span5 {required:true}"></textarea>
                                        </td>
                                    </tr>
                                    <c:set var="iterador" value="${iter.index + 1}" />
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" name="count" id="count" value="${iterador}">
                        <div class="form-actions">
                            <button class="btn btn-primary" type="submit">Asignar Ponderación</button>
                            <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </ul>
        </div><!--/span-->        
    </div><!--/row-->    
</div>