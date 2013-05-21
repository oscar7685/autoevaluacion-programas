<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
    <c:when test="${fn:length(listMuestraSeleccionada)!= 0}">
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <th>Cedula</th>    
            <th>Nombre</th>
        </thead>
        <tbody>
            <c:forEach items="${listMuestraSeleccionada}" var="row" varStatus="iter">
                <tr>
                    <td>   
                        <c:out value="${row.id}"/>
                    </td>
                    <td>   
                        <c:out value="${row.nombre}"/>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="#preparedEvaluador" class="btn btn-large btn-primary llamador"><i class="icon-plus"> </i><i class="icon-user"></i> Registrar Evaluador</a>
</c:when>
<c:otherwise>
    No  se han ponderado los factores en el sistema para este proceso.
    <br><br>
    <a href="#preparedPonderarFactor" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Asignar Ponderación</a>
</c:otherwise>
</c:choose>
