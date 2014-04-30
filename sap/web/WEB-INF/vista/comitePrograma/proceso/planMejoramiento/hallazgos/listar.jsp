<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Listado de  Hallazgos</h3>
            <c:choose>
                <c:when test="${fn:length(listHallazgos)!= 0}">
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Hallazgo</th>
                        <th>Estrategia</th>    
                        <th>Meta</th>    
                        <th>Indicador de cumplimiento</th>    
                        <th>Tiempo ejecución</th>    
                        <th>Responsable</th>    
                        <th>Financiación</th>    
                        </thead>
                        <tbody>
                            <c:forEach items="${listHallazgos}" var="item" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${item.hallazgo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.estrategia}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.meta}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.indicadorCumplimiento}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.responsable}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.financiacion}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.fechaInicio}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.fechaFinal}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    Aun no existen Hallazgos para este plan de estrat&eacute;gico.<br/>
                </c:otherwise>
            </c:choose>
            <a href="#crearHallazgo" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear hallazgo</a>
        </div>
    </div>
</div>    

