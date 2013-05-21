<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Ponderaci�n de  Caracter�sticas</h3>
            <c:choose>
                <c:when test="${fn:length(listPonderacionCara)!= 0}">
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>C&oacute;digo</th>    
                        <th>Caracter�stica</th>
                        <th>Nivel de importancia</th>
                        <th>Ponderaci&oacute;n</th>
                        <th>Justificaci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listPonderacionCara}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.caracteristicaId.codigo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.caracteristicaId.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.nivelimportancia}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.ponderacion}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.justificacion}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${EstadoProceso == 1}">
                        <a href="#preparedEditPonderarCara" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Ponderaci�n</a>
                    </c:if>
                </c:when>
                <c:otherwise>
                    No  se han ponderado las caracter�sticas en el sistema para este proceso.
                    <br><br>
                    <a href="#preparedPonderarCara" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Ponderaci�n</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    

