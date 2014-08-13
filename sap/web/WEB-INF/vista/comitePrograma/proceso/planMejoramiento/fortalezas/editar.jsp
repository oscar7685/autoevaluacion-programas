<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $("#formEditarFortaleza").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editarFortaleza2",
                    data: $("#formEditarFortaleza").serialize(),
                    success: function() {
                        location = "/sap/#listarFortalezas";
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
                    <li><a href="#home" role="tab" data-toggle="tab">Plan de mejoramiento</a></li>
                    <li class="active"><a href="#profile" role="tab" data-toggle="tab">Plan de mantenimiento</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane" id="home">
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

                    <div class="tab-pane active" id="profile">
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath()%>/#listarFortalezas" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar fortalezas">Fortalezas</a> <span class="divider">/</span></li>
                            <li>Editar</li>
                            <a id="printEnlace" target="_blank" href="/sap/controladorCP?action=PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
                        </ul>
                         <form id="formEditarFortaleza" class="form" method="post">
                            <fieldset>
                                <legend>Editar fortaleza</legend>
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
                                    <label for="hallazgo" class="control-label">Fortaleza</label>
                                    <div class="controls">
                                        <textarea rows="4" name="hallazgo" id="hallazgo" class="input-xxlarge {required:true}">${hallazgo.hallazgo}</textarea>
                                    </div>
                                </div>


                                <div class="form-actions span8">
                                    <button class="btn btn-primary" type="submit">Editar fortaleza</button>
                                    <button class="btn" type="reset">Cancelar</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>        
                </div>
            </div>
        </div>
    </div>
</div>