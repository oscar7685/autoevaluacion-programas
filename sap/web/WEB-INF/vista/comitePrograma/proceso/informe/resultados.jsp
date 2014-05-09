<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">
    .table td {
        text-align: center;   
    }
</style>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Factor</th>
            <th>Pf</th>
            <th>Cump</th>
            <th>Caracteristica</th>
            <th>Pc</th>
            <th>Cump</th>
            <th>Indicador</th>
            <th>Cump</th>
            <th>Encuesta</th>
            <th>Inf num/est</th>
            <th>Inf Doc</th>

        </tr>
    </thead>
    <tbody>
        <c:set var="indiceF" value="-1"></c:set>
        <c:set var="indiceC" value="-1"></c:set>
        <c:set var="indiceFactor" value=""></c:set>
        <c:set var="indiceCaracteristicas" value=""></c:set>
        <c:forEach items="${listIndicadores}" var="indicador" varStatus="status">
            <tr>
                <c:choose>
                    <c:when test="${indicador.caracteristicaId.factorId.id != indiceFactor}">
                        <c:set var="indiceF" value="${indiceF+1}"></c:set>
                        <c:set var="indiceFactor" value="${indicador.caracteristicaId.factorId.id}"></c:set>
                        <td rowspan="${indicador.caracteristicaId.factorId.CantiIndicadores()}">${indicador.caracteristicaId.factorId.codigo}</td>
                        <td rowspan="${indicador.caracteristicaId.factorId.CantiIndicadores()}"><%--${ponderacionesF.get(indiceF).ponderacion}--%></td>
                        <td rowspan="${indicador.caracteristicaId.factorId.CantiIndicadores()}">${cumplimientoF[indiceF]}</td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${indicador.caracteristicaId.id != indiceCaracteristicas}">
                        <c:set var="indiceC" value="${indiceC+1}"></c:set>
                        <c:set var="indiceCaracteristicas" value="${indicador.caracteristicaId.id}"></c:set>
                        <td rowspan="${indicador.caracteristicaId.CantiIndicadores()}">${indicador.caracteristicaId.codigo}</td>
                        <td rowspan="${indicador.caracteristicaId.CantiIndicadores()}">${ponderacionesC[indiceCaracteristicas]}</td>
                        <td rowspan="${indicador.caracteristicaId.CantiIndicadores()}">${cumplimientoC[indiceC]}</td>
                    </c:when>
                </c:choose>
                <td>${indicador.codigo}</td>
                <td><c:choose>
                        <c:when test="${cumplimientoI[status.index] == 0}">
                            N/A
                        </c:when>  
                        <c:otherwise>
                            ${cumplimientoI[status.index]}
                        </c:otherwise>    
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${promedioE[status.index] == 0}">
                            N/A
                        </c:when>  
                        <c:otherwise>
                            ${promedioE[status.index]}
                            
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Pregunta</th>
                                        <th>Promedio</th>
                                        <th>Es</th>
                                        <th>Do</th>
                                        <th>Ad</th>
                                        <th>Eg</th>
                                        <th>Di</th>
                                        <th>Em</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${indicador.preguntaList}" var="pregunta" varStatus="status3">
                                    <tr>
                                        <td>${pregunta.codigo}</td>
                                        <td>${PromedioPreguntasXindicador.get(status.index).get(status3.index)}</td>
                                        <td>${PromedioPreguntasXindicadorEs.get(status.index).get(status3.index)}</td>
                                        <td>${PromedioPreguntasXindicadorDo.get(status.index).get(status3.index)}</td>
                                        <td>${PromedioPreguntasXindicadorAd.get(status.index).get(status3.index)}</td>
                                        <td>${PromedioPreguntasXindicadorEg.get(status.index).get(status3.index)}</td>
                                        <td>${PromedioPreguntasXindicadorDi.get(status.index).get(status3.index)}</td>
                                        <td>${PromedioPreguntasXindicadorEm.get(status.index).get(status3.index)}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>   
                            </table>
                            
                        </c:otherwise>    
                    </c:choose>    

                </td>
                <td>
                    <c:choose>
                        <c:when test="${numerico[status.index] == 0}">
                            N/A
                        </c:when>  
                        <c:otherwise>
                            ${numerico[status.index]}
                        </c:otherwise>    
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${documental[status.index] == 0}">
                            N/A
                        </c:when>  
                        <c:otherwise>
                            ${documental[status.index]}
                        </c:otherwise>    
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>