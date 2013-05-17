<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <br/>
            <h3>Ponderación de  Factores</h3>
            <c:choose>
                <c:when test="${fn:length(listPonderacionFactor)!= 0}">
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>C&oacute;digo</th>    
                        <th>Factor</th>
                        <th>Ponderaci&oacute;n</th>
                        <th>Justificaci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listPonderacionFactor}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.factorId.codigo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.factorId.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.ponderacion}"/>
                                    </td> <td>   
                                        <c:out value="${row.justificacion}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No  se han ponderado los factores en el sistema para este proceso.
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    

