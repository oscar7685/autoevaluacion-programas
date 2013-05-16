<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <br/>
            <h3>Listado de  Preguntas</h3>
            <c:choose>
                <c:when test="${fn:length(listaP)!= 0}">

                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>C&oacute;digo</th>    
                        <th>Pregunta</th>
                        <th>Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaP}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.codigo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.pregunta}"/>
                                    </td>
                                    <td class="action span2">
                                        <a href="#editarPregunta" title="Editar"><i class="icon-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen preguntas registradas en el sistema para este modelo.
                </c:otherwise>
            </c:choose>
             <br/>       
             <a href="#crearPregunta" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear pregunta</a>
             
        </div>
    </div>
</div>    

