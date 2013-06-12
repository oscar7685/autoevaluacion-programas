<%-- 
    Document   : controlPanel
    Created on : 11-jun-2013, 18:22:09
    Author     : Arturo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Procesos de autoevaluación activos</h3>
            <c:choose>
                <c:when test="${fn:length(listProcesos)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Facultad</th>    
                        <th>Programa</th>
                        <th>Fecha de Inicio</th>
                        <th>Estado</th>
                        <th>Operaciones</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listProcesos}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.programaId.facultadId.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.programaId.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.fechainicio}"/>
                                    </td>
                                    <c:if test="${row.fechainicio == 'En Configuración'}">
                                        <td>
                                            <c:out value="En Configuración"/>
                                        </td>
                                        <td>
                                           <i class="icon-chevron-sign-right"></i><a href="#ejecutarPro&${row.id}"> Ejecutar Proceso</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${row.fechainicio != 'En Configuración'}">
                                        <td>   
                                            <c:out value="En Ejecución"/>
                                        </td>
                                        <td>
                                            <i class="icon-flag-checkered"></i><a href=""> Finalizar Proceso</a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No  se han encontrado procesos activos.
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>