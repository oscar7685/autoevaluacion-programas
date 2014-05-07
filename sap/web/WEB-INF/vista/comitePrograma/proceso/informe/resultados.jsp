<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                        <td rowspan="${indicador.caracteristicaId.factorId.CantiIndicadores()}">${ponderacionesF.get(indiceF).ponderacion}</td>
                        <td rowspan="${indicador.caracteristicaId.factorId.CantiIndicadores()}">${cumplimientoF[indiceF]}</td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${indicador.caracteristicaId.id != indiceCaracteristicas}">
                        <c:set var="indiceC" value="${indiceC+1}"></c:set>
                        <c:set var="indiceCaracteristicas" value="${indicador.caracteristicaId.id}"></c:set>
                        <td rowspan="${indicador.caracteristicaId.CantiIndicadores()}">${indicador.caracteristicaId.codigo}</td>
                        <td rowspan="${indicador.caracteristicaId.CantiIndicadores()}">${ponderacionesC.get(indiceC).ponderacion}</td>
                        <td rowspan="${indicador.caracteristicaId.CantiIndicadores()}">${cumplimiento[indiceC]}</td>
                    </c:when>
                </c:choose>
                <td>${indicador.codigo}</td>
                <td>
                    <c:forEach items="${indicador.preguntaList}" var="pregunta" varStatus="status2">
                        ${promedioE.get(status.index)[status2.index]}
                    </c:forEach>
                </td>
                <td>${numerico[status.index].evaluacion}</td>
                <td>${documental[status.index].evaluacion}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>