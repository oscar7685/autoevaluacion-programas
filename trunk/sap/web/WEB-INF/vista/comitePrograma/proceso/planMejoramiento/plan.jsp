<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span12" style="text-align: justify">
            <div class="row">
                <ul class="breadcrumb">
                    <li class="active">Plan de mejoramiento<span class="divider">/</span></li>
                    <li><a href="<%=request.getContextPath()%>/#listarProyectosE">Proyectos estratégicos</a></li>
                    <a id="printEnlace" style="float: right; cursor: pointer;"><i class="icon-print"></i> Imprimir</a>
                </ul>
                <table class="table table-bordered table-striped" style="font-weight: bold;">
                    <tbody>
                        <tr>
                            <td rowspan="3" style="width: 25%; text-align: center;"><img src="<%=request.getContextPath()%>/img/LogoU.png"></td>
                            <td style="width: 50%; text-align: center;">UNIVERSIDAD DE CARTAGENA</td>
                            <td style="width: 25%;">CÓDIGO: FO-DO/004</td>
                        </tr>
                        <tr>
                            <td style="width: 50%; text-align: center;">AUTOEVALUACIÓN Y ACREDITACIÓN</td>
                            <td>VERSIÓN: 00</td>
                        </tr>
                        <tr>
                            <td style="width: 50%; text-align: center;">PLAN DE MEJORAMIENTO</td>
                            <td>FECHA: 07/04/2012</td>
                        </tr>
                    </tbody>
                </table>
            <c:forEach items="${listProyectoEstrategico}" var="proyecto" varStatus="status">
                    <table class="table table-bordered table-striped">
                        <tbody>
                            <tr>
                                <td style="width: 25%;text-align: center;">PROYECTO ESTRATÉGICO</td>
                                <td><a href="#editarPEstrategico&${proyecto.idproyectoestrategico}" title="Editar Proyecto estratégico">${proyecto.proyecto}</a></td>
                            </tr>
                            <tr>
                                <td style="width: 25%;text-align: center;vertical-align:middle;">OBJETIVO</td>
                                <td>${proyecto.objetivo}</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-striped table-bordered">
                        <thead>
                        <th>Hallazgo</th>
                        <th>Estrategia</th>    
                        <th>Meta</th>    
                        <th>Indicador de cumplimiento</th>    
                        <th>Fecha inicio</th>    
                        <th>Fecha final</th>    
                        <th>Responsable</th>    
                        <th>Financiación</th>    
                        <th>Estado</th>    
                        </thead>
                        <tbody>
                            <c:forEach items="${proyecto.hallazgoList}" var="item" varStatus="iter">
                                <tr>
                                    <td>
                                        <a href="#editarHallazgo&${item.idhallazgo}" title="Editar Hallazgo">${item.hallazgo}</a>
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
                                        <c:out value="${item.estado}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:forEach>



            </div>


        </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        $("#printEnlace").click(function() {
            $(".hero-unit").printArea();
            //    return false;
        });
    });
</script>
