<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li><a href="<%=request.getContextPath()%>/#planMejoramiento">Plan de mejoramiento</a> <span class="divider">/</span></li>
                <li><a href="<%=request.getContextPath()%>/#listarProyectosE">Proyectos estratégicos</a> <span class="divider">/</span></li>
                <li><a href="<%=request.getContextPath()%>/#editarPEstrategico&${proyectoE.idproyectoestrategico}" data-placement="left" rel="tooltip" data-original-title="${proyectoE.proyecto}" class="tool">Proyecto</a><span class="divider">/</span></li>
                <li class="active">Hallazgos</li>
            </ul>
            <h3>Listado de  Hallazgos</h3>
            <c:choose>
                <c:when test="${fn:length(listHallazgos)!= 0}">
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Hallazgo</th>
                        <th>Estrategia</th>    
                        <th>Meta</th>    
                        <th>Indicador de cumplimiento</th>    
                        <th>Fecha inicio</th>    
                        <th>Fecha final</th>    
                        <th>Responsable</th>    
                        <th>Financiación</th>    
                        <th></th>    
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
                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${item.fechaInicio}' />    
                                    </td>
                                    <td>   
                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${item.fechaFinal}' />
                                    </td>
                                    <td>   
                                        <c:out value="${item.responsable}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.financiacion}"/>
                                    </td>
                                    <td>   
                                        <a href="#editarHallazgo&${item.idhallazgo}" title="Editar"><i class="icon-edit"></i></a>
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

