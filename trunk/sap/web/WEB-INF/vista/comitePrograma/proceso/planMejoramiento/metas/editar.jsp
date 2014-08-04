<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $('#inicio').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#final').datepicker({
            format: 'dd/mm/yyyy'
        });

        $("#formEditarMeta").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editarMeta2",
                    data: $("#formEditarMeta").serialize(),
                    success: function() {
                        location = "/sap/#verMetas&${objetivo.idobjetivos}";
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
                            <li><a href="<%=request.getContextPath()%>/#listarHallazgos" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar hallazgos">Hallazgos</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#editarHallazgo&${hallazgo.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="${hallazgo.hallazgo}">Hallazgo</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#listarObjetivos&${hallazgo.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar objetivos">Objetivos</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#editarObjetivo&${objetivo.idobjetivos}" class="tool" data-placement="top" rel="tooltip" data-original-title="${objetivo.objetivo}">Objetivo</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#verMetas&${objetivo.idobjetivos}" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar metas">Metas</a> <span class="divider">/</span></li>
                            <li>Editar</li>
                            <a id="printEnlace" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
                        </ul>

                        <form id="formEditarMeta" class="form-horizontal" method="post">
                            <fieldset>
                                <legend>Editar meta</legend>
                                <div class="control-group">
                                    <label for="meta" class="control-label">Meta</label>
                                    <div class="controls">
                                        <textarea rows="2" name="meta" id="meta" class="input-xxlarge {required:true}">${meta.meta}</textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="estrategia" class="control-label">Estrategia</label>
                                    <div class="controls">
                                        <textarea rows="2" name="estrategia" id="estrategia" class="input-xxlarge {required:true}">${meta.estrategia}</textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="indicador" class="control-label">Indicador de cumplimiento</label>
                                    <div class="controls">
                                        <textarea rows="2" name="indicador" id="indicador" class="input-xxlarge {required:true}">${meta.indicadorCumplimiento}</textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="inicio" class="control-label">Fecha de Inicio</label>
                                    <div class="controls">
                                        <input type="text" name="inicio" id="inicio" class="form-control"
                                               value="<fmt:formatDate pattern='dd/MM/yyyy' value='${meta.fechaInicio}' />" >
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="final" class="control-label">Fecha Final</label>
                                    <div class="controls">
                                        <input type="text" name="final" id="final" class="form-control"
                                               value="<fmt:formatDate pattern='dd/MM/yyyy' value='${meta.fechaFinal}' />" >
                                    </div>
                                </div>    
                                <div class="control-group">
                                    <label for="responsables" class="control-label">Responsables</label>
                                    <div class="controls">
                                        <textarea rows="2" name="responsables" id="responsables" class="input-xxlarge {required:true}">${meta.responsable}</textarea>
                                    </div>
                                </div>    
                                <div class="control-group">
                                    <label for="recursos" class="control-label">Recursos o Financiaci�n</label>
                                    <div class="controls">
                                        <textarea rows="2" name="recursos" id="recursos" class="input-xxlarge {required:true}">${meta.financiacion}</textarea>
                                    </div>
                                </div>    
                                <div class="form-actions span8">
                                    <button class="btn btn-primary" type="submit">Guardar cambios</button>
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