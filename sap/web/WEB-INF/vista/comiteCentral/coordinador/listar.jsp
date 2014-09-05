<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3 style="margin: 0;">Listado de  Coordinadores de programa</h3>
            <c:choose>
                <c:when test="${fn:length(listaCoo)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span1">C&oacute;digo</th>    
                        <th class="span4">Nombre</th>
                        <th class="span4">Programa</th>
                        <th class="span1">Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaCoo}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.id}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.programaId.nombre}"/>
                                    </td>
                                    <td class="action span2">
                                        <a href="#editarCoordinador&${row.id}" title="Editar"><i class="icon-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen Coordinadores de programa registrados en el sistema.
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>