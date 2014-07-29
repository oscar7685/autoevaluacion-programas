<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span12" style="text-align: justify">
            <div class="row">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#home" role="tab" data-toggle="tab">Plan de mejoramiento</a></li>
                    <li><a href="#profile" role="tab" data-toggle="tab">Plan de mantenimiento</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <form id="formCrearCaracteristica" class="form-horizontal" method="post">
                            <fieldset>
                                <legend>Crear Hallazgo</legend>
                            <div class="control-group">
                                <label for="hallazgo" class="control-label">Hallazgo</label>
                                <div class="controls">
                                    <textarea rows="3" name="hallazgo" id="hallazgo" class="input-xxlarge {required:true}"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="caracteristica" class="control-label">Asignar Caracteristica</label>
                                <div class="controls">
                                    <select id="caracteristica" name="caracteristica" class=" input-xxlarge {required:true}">
                                        <option></option>
                                        <c:forEach items="${listaC}" var="row" varStatus="iter">
                                            <option value="${row.id}">${row.codigo} ${row.nombre}</option>
                                        </c:forEach>
                                    </select>                
                                </div>
                            </div>
                                <legend>Formulación</legend>
                                <div class="control-group">
                                <label for="objetivo" class="control-label">Objetivos</label>
                                <div class="controls">
                                    <textarea rows="3" name="objetivo" id="objetivo" class="input-xxlarge {required:true}"></textarea>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button class="btn btn-primary" type="submit">Crear hallazgo</button>
                                <button class="btn" type="reset">Cancelar</button>
                            </div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="tab-pane" id="profile">Crear fortaleza</div>
                </div>
            </div>
        </div>
    </div>
</div>


