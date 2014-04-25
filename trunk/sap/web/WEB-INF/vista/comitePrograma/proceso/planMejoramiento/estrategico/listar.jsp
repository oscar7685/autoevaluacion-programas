<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Listado de  Proyectos Estrategicos</h3>
            <c:choose>
                <c:when test="${fn:length(listProyectoEstrategico)!= 0}">
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Proyecto estrategico</th>
                        <th>Objetivo</th>    
                        <th></th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listProyectoEstrategico}" var="item" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${item.proyecto}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${item.objetivo}"/>
                                    </td>
                                    <td class="action span2">
                                        <a href="#verProyectoEstrategico&${item.idproyectoestrategico}" title="Entrar"><i class="icon-signin"></i></a>
                                        <a href="#editarPEstrategico&${item.idproyectoestrategico}" title="Editar"><i class="icon-edit"></i></a>
                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen proyectos estrategicos para este plan de mejoramiento.<br/>
                </c:otherwise>
            </c:choose>
            <a href="#crearProyectoEstrategico" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear proyecto estrategico</a>
        </div>
    </div>
</div>    

