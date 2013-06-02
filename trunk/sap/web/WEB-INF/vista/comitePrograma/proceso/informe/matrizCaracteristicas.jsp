<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">

    .inicial td {
        text-align: right;
    }
</style>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <br/>
            <legend>Matriz de Calidad de Caracteristicas</legend>
            <ul class="breadcrumb">
                <li><a href="<%=request.getContextPath()%>/#informeMatrizFactores">Matriz de Calidad de Factores</a> <span class="divider">/</span></li>
                <li class="active">Matriz de Calidad de Características</li>
            </ul>
            <br>
            <c:choose>
                <c:when test="${caracteristicas.size()!= 0}">

                    <table class="table table-striped table-bordered table-condensed inicial">
                        <thead>
                        <th>Id Factor</th>
                        <th>Id</th>
                        <th>Caracteristica</th>
                        <th>Nivel de importacia</th>
                        <th>Ponderacion caracteristica</th>
                        <th>Grado de Cumplimiento</th>
                        <th>Evaluacion teniendo en cuenta ponderacion</th>
                        <th>Logro ideal</th>
                        <th>Relacion con el logro ideal</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${caracteristicas}" var="caracteristica" varStatus="iter">
                                <fmt:parseNumber var="cum"  value="${cumplimiento[iter.index]}" />
                                <c:choose>
                                    <c:when test="${cum>0}"> 
                                        <tr>
                                            <td style="text-align: left">   
                                                ${caracteristica.factorId.codigo}
                                            </td>
                                            <td style="text-align: left">   
                                                ${caracteristica.codigo}
                                            </td>
                                            <td style="text-align: left">   
                                                <a href="#detalleCaracteristica&${caracteristica.id}" data="${caracteristica.id}">${caracteristica.nombre}</a> 
                                            </td>
                                            <td>   

                                            </td>
                                            <td>   

                                            </td>
                                            <td>   
                                                ${cumplimiento[iter.index]}
                                            </td>
                                            <td>   

                                            </td>
                                            <td>   

                                            </td>
                                            <td>   

                                            </td>
                                        </tr>
                                    </c:when>
                                </c:choose>


                            </c:forEach>
                        </tbody>
                    </table>
                    <br/>
                    <div id="grafica" style="min-width: 400px; height: 500px; margin: 0 auto">

                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Escala</th>
                                <th>Descripci&oacute;n</th>
                                <th>Grado de cumplimiento</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="background-color: #89A54E;">
                                <td>
                                    4.5 a 5.0
                                </td>
                                <td>
                                    Se cumple plenamente
                                </td>
                                <td>
                                    90% a 100%
                                </td>
                            </tr>
                            <tr style="background-color: #80699B;">
                                <td>
                                    4.0 a 4.4
                                </td>
                                <td>
                                    Se cumple en alto grado
                                </td>
                                <td>
                                    80% a 89%
                                </td>
                            </tr>
                            <tr style="background-color: #3D96AE;">
                                <td>
                                    3.0 a 3.9
                                </td>
                                <td>
                                    Se cumple en mediano grado
                                </td>
                                <td>
                                    60% a 79%
                                </td>
                            </tr>
                            <tr style="background-color: #DB843D;">
                                <td>
                                    2.0 a 2.9
                                </td>
                                <td>
                                    Se cumple en bajo grado
                                </td>
                                <td>
                                    40% - 59%
                                </td>
                            </tr>
                            <tr style="background-color: #AA4643;">
                                <td>
                                    1.0 a 1.9
                                </td>
                                <td>
                                    No se cumple
                                </td>
                                <td>
                                    0% - 39%
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No Existen Hay datos Registrados en el Sistema.
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    
