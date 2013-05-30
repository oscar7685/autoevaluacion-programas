<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
    $(function() {
        var sum = 0;
        $("input[name^='ponderacion']").each(function() {
            sum += Number($(this).val());

        });
        $("li a#total").html("<strong>Total Ponderacion: " + sum + "</strong>");

        $("input[name^='ponderacion']").keyup(function() {
            var suma = 0;
            $("input[name^='ponderacion']").each(function() {
                suma += Number($(this).val());

            });
            $("li a#total").html("<strong>Total Ponderacion: " + suma + "</strong>");

        });


        $("#formEditPonderarFactor").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editPonderarFactor",
                    data: $("#formEditPonderarFactor").serialize(),
                    success: function() {
                        location = "/sap/#listPonderacionFactor";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="subnav span10" style="position: fixed;">
    <ul class="nav nav-pills">
        <li><a href="#PonderacionFactores"><strong>Ponderación de Factores</strong></a></li>
            <c:forEach items="${factores.rowsByIndex}" var="row" varStatus="iter">
                <c:choose>
                    <c:when test="${((iter.index) % 5 == 0) || (iter.index == 0)}">
                        <c:choose>
                            <c:when test="${(iter.index == 0)}">
                            <li class="active"><a href="#PonderacionFactores${iter.index+1}">${iter.index + 1} - ${iter.index + 5}</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="#PonderacionFactores${iter.index+1}">${iter.index + 1} - ${iter.index + 5}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
            </c:forEach>
        <li><a id="total"><strong>Total Ponderacion: </strong></a></li>
    </ul>
</div>
<br><br>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="nav nav-pills">
                <form id="formEditPonderarFactor" class="form-horizontal" method="post">
                    <fieldset>
                        <legend>Ponderación de Factores</legend>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Factor</th>
                                    <th>Ponderacion</th>
                                    <th>Justificacion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listPonderacionFactor}" var="row" varStatus="iter">
                                    <tr id="PonderacionFactores${iter.index+1}">    
                                        <td>   
                                            <c:out value="${row.factorId.codigo}"/>
                                        </td>
                                        <td>   
                                            <c:out value="${row.factorId.nombre}"/>
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