<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        
        $("#formEditarHallazgo").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editarHallazgo2",
                    data: $("#formEditarHallazgo").serialize(),
                    success: function() {
                        location = "/sap/#listarHallazgos";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
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
                            <li><a href="<%=request.getContextPath()%>/#listarHallazgos">Hallazgos</a> <span class="divider">/</span></li>
                            <li>Editar</li>
                            <a id="printEnlace" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
                        </ul>

                      <form id="formEditarHallazgo" class="form" method="post">
                <fieldset>
                    <legend>Editar hallazgo</legend>
                    <div class="control-group">
                        <label for="caracteristica" class="control-label">Asignar Caracteristica</label>
                        <div class="controls">
                            <select id="caracteristica" name="caracteristica" class=" input-xxlarge {required:true}">
                                <option></option>
                                <c:forEach items="${listaC}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${row != hallazgo.getCaracteristicaId()}">
                                            <option value="${row.id}">${row.codigo} ${row.nombre}</option>    
                                        </c:when>
                                        <c:otherwise>
                                            <option selected="selected" value="${row.id}">${row.codigo} ${row.nombre}</option>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="hallazgo" class="control-label">Hallazgo</label>
                        <div class="controls">
                            <textarea rows="4" name="hallazgo" id="hallazgo" class="input-xxlarge {required:true}">${hallazgo.hallazgo}</textarea>
                        </div>
                    </div>


                    <div class="form-actions span8">
                        <button class="btn btn-primary" type="submit">Editar Hallazgo</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>

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
                                    <th>Financiación</th>    
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
