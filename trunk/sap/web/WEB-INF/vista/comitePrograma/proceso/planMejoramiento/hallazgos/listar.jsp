<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span10" style="text-align: justify">
            <div class="row">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#home" role="tab" data-toggle="tab">Plan de mejoramiento</a></li>
                    <li><a href="#profile" role="tab" data-toggle="tab">Plan de mantenimiento</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <ul class="breadcrumb">
                            <li>Hallazgos</li>
                            <a id="printEnlace" target="_blank" href="/sap/controladorCP?action=PM" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
                        </ul>
                        <h3>Listado de  Hallazgos</h3>
                        <c:choose>
                            <c:when test="${fn:length(listHallazgos)!= 0}">
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead>
                                    <th>Hallazgo</th>
                                    <th>Caracteristica</th>    
                                    <th>Acci&oacute;n</th>    
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listHallazgos}" var="item" varStatus="iter">
                                            <tr>
                                                <td>   
                                                    <c:out value="${item.hallazgo}"/>
                                                </td>
                                                <td>   
                                                    <c:out value="${item.caracteristicaId.nombre}"/>
                                                </td>
                                                <td>   
                                                    <a href="#editarHallazgo&${item.idhallazgo}" title="Editar"><i class="icon-edit"></i></a>
                                                    <a href="#listarObjetivos&${item.idhallazgo}" title="Ver objetivos"><i class="icon-signin"></i></a>
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

                    <div class="tab-pane" id="profile">
                        <ul class="breadcrumb">
                            <li>Fortalezas</li>
                            <a id="printEnlace" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
                        </ul>
                        <h3>Listado de  Fortalezas</h3>
                        <c:choose>
                            <c:when test="${fn:length(listFortalezas)!= 0}">
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead>
                                    <th>Fortaleza</th>
                                    <th>Estrategia</th>    
                                    <th>Meta</th>    
                                    <th>Indicador de cumplimiento</th>    
                                    <th>Fecha inicio</th>    
                                    <th>Fecha final</th>    
                                    <th>Responsable</th>    
                                    <th>Financiaci�n</th>    
                                    <th></th>    
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listFortalezas}" var="item2" varStatus="iter2">
                                            <tr>
                                                <td>   
                                                    <c:out value="${item2.hallazgo}"/>
                                                </td>
                                                <td>   
                                                    <c:out value="${item2.estrategia}"/>
                                                </td>
                                                <td>   
                                                    <c:out value="${item2.meta}"/>
                                                </td>
                                                <td>   
                                                    <c:out value="${item2.indicadorCumplimiento}"/>
                                                </td>
                                                <td>   
                                                    <fmt:formatDate pattern='yyyy/MM/dd' value='${item2.fechaInicio}' />    
                                                </td>
                                                <td>   
                                                    <fmt:formatDate pattern='yyyy/MM/dd' value='${item2.fechaFinal}' />
                                                </td>
                                                <td>   
                                                    <c:out value="${item2.responsable}"/>
                                                </td>
                                                <td>   
                                                    <c:out value="${item2.financiacion}"/>
                                                </td>
                                                <td>   
                                                    <a href="#editarHallazgo&${item2.idhallazgo}" title="Editar"><i class="icon-edit"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                Aun no existen Fortalezas para este plan de mantenimiento.<br/>
                            </c:otherwise>
                        </c:choose>
                        <a href="#crearFortaleza" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear fortaleza</a>    
                    </div>        
                </div>
            </div>
        </div>
    </div>
</div>
