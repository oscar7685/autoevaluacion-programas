<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <br/>
            <h3>Listado de  Modelos</h3>
              <c:choose>
                <c:when test="${fn:length(listaM)!= 0}">

                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Modelo</th>    
                        <th>Descripcion</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaM}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.descripcion}"/>
                                    </td>
                                    <td class="action span2">
                                        <a href="#editarModelo" title="Editar"><i class="icon-edit"></i></a>
                                        <a href="#entrarModelo" title="Entrar"><i class="icon-level-down"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No Existen Modelos Registrados en el Sistema.
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    

