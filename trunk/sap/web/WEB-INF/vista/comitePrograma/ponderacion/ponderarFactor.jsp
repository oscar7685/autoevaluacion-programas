<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
    $(function() {
        $("a[data-dismiss='alert']").click(function(e) {
            $(this).parent("div").hide();
            e.preventDefault();
            e.stopPropagation();
        });
        var sum = 0;
        $("input[name^='ponderacion']").each(function() {
            sum += Number($(this).val());

        });
        $("li a#total").html("<strong>Total Ponderacion: " + sum + "</strong>");

        $("input[name^='ponderacion']").keyup(function() {
            var suma = 0;
            $("input[name^='ponderacion']").each(function() {
                suma += Number($(this).val());

            });
            $("li a#total").html("<strong>Total Ponderacion: " + suma + "</strong>");

        });

        $('a[href^=#PonderacionFactores]').click(function() {

            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                    && location.hostname == this.hostname) {

                var $target2 = $(this.hash);

                $target2 = $target2.length && $target2 || $('[name=' + this.hash.slice(1) + ']');
                if ($target2.length) {
                    var targetOffset = $target2.offset().top;
                    var actual = $('div.ui-layout-center').scrollTop();
                    if (actual != 0) {
                        $('div.ui-layout-center').animate({scrollTop: actual + targetOffset - 120}, 500);
                    } else {
                        $('div.ui-layout-center').animate({scrollTop: targetOffset - 118}, 500);
                    }


                    return false;
                }

            }
        });

        $("#formPonderarFactor").validate({
            errorElement: "em"
                    ,
            highlight: function(element, errorClass) {
                $(element).parent("td").children("div").addClass("in");
                $(element).parent("td").children("div").show();
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).parent("td").children("div").removeClass("in");
                $(element).parent("td").children("div").hide();
                if ($('#PonderacionFactores').is(':visible')) {
                    var suma2 = 0;
                    $("input[name^='ponderacion']").each(function() {
                        suma2 += Number($(this).val());
                    });
                    if (suma2 === 100) {
                        $('#PonderacionFactores').hide();
                    }
                }
            },
            errorPlacement: function(error, element) {
                error.appendTo($(element).parent("td").children("div"));
            },
            rules: {
                field: {
                    required: true,
                    number: true
                }
            },
            submitHandler: function() {
                var suma = 0;
                $("input[name^='ponderacion']").each(function() {
                    suma += Number($(this).val());


                });
                if (suma === 100) {
                    setTimeout(function() {
                        $.ajax({
                            type: 'POST',
                            url: "/sap/controladorCP?action=ponderarFactor",
                            data: $("#formPonderarFactor").serialize(),
                            success: function() {
                                location = "/sap/#listPonderacionFactor";
                            } //fin success
                        }); //fin $.ajax    
                    }, 400);
                } else {

                    $(".alert-error").show();
                    $("ul.nav-pills li:eq(0) a").trigger("click");
                }


            } //fin submitHandler

        });
    });
</script>
<div class="subnav span10" style="position: fixed;">
    <ul class="nav nav-pills">
        <li><a href="#PonderacionFactores"><strong>Ponderación de Factores</strong></a></li>
            <c:forEach items="${listFactor}" var="row" varStatus="iter">
                <c:choose>
                    <c:when test="${((iter.index) % 5 == 0) || (iter.index == 0)}">
                        <c:choose>
                            <c:when test="${(iter.index == 0)}">
                            <li class="active"><a href="#PonderacionFactores${iter.index+1}">${iter.index + 1} - ${iter.index + 5}</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="#PonderacionFactores${iter.index+1}">${iter.index + 1} - ${iter.index + 5}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
            </c:forEach>
        <li><a id="total"><strong>Total Ponderacion: </strong></a></li>
    </ul>
</div>
<div class="hero-unit" style="padding-top: 50px;">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="nav nav-pills">
                <form id="formPonderarFactor" class="form-horizontal" method="post">
                    <fieldset>
                        <legend>Ponderación de Factores</legend>
                        <div class="alert alert-block alert-error" style="display:none" id="PonderacionFactores">
                            <a href="#" data-dismiss="alert" class="close">×</a>
                            <h4 class="alert-heading">Ha ocurrido un error!</h4>
                            <p>La suma de la ponderacion de los factores debe ser 100.</p>
                            <a class="btn btn-danger" data-dismiss="alert" href="#">Cerrar</a>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Factor</th>
                                    <th>Ponderacion</th>
                                    <th>Justificacion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listFactor}" var="row" varStatus="iter">
                                    <tr id="PonderacionFactores${iter.index+1}">    
                                        <td>   
                                            <c:out value="${row.codigo}"/>
                                        </td>
                                        <td>   
                                            <c:out value="${row.nombre}"/>
                                        </td>
                                        <td>
                                            <input name="ponderacion${row.id}" class="span1 {required:true,number:true}" type="text">
                                            <div class='alert alert-error fade' style="display: none">
                                                <a data-dismiss='alert' class='close'>×</a>  
                                                <strong>Error!</strong>
                                            </div>
                                            <input type="hidden"  value="${row.id}" name="id${row.id}">
                                        </td>
                                        <td>
                                            <textarea name="justificacion${row.id}" rows="4" class="span5 {required:true}"></textarea>
                                        </td>
                                    </tr>
                                    <c:set var="iterador" value="${iter.index + 1}" />
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" name="count" id="count" value="${iterador}">
                        <div class="form-actions">
                            <button class="btn btn-primary" type="submit">Asignar Ponderación</button>
                            <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </ul>
        </div><!--/span-->        
    </div><!--/row-->    
</div>