<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
    Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form JSP Tarea</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
        <h3>Formulario de productos</h3>
        <%
            if(errores != null && errores.size()>0){
        %>
        <ul class="alert alert-danger mx-5 px-5">
            <% for(String error: errores.values()){%>
                <li><%=error%></li>
            <%}%>
        </ul>
        <%}%>
        <div class="px-5">
            <form action="/webapp-form-tarea2/crear" method="post">
                <div class="row mb-3">
                    <label for="nombre" class="col-form-label col-sm-2">Nombre</label>
                    <div class="col-sm-4">
                        <input type="text" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
                    </div>
                <%
                if(errores != null && errores.containsKey("nombre")){
                     out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("nombre") + "</small>");
                }
                %>
                </div>

                <div class="row mb-3">
                    <label for="precio" class="col-form-label col-sm-2">Precio</label>
                    <div class="col-sm-4"><input type="text" name="precio" id="precio" class="form-control" value="${param.precio}"></div>
                        <%
                            if(errores != null && errores.containsKey("precio")){
                                 out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("precio") + "</small>");
                            }
                        %>
                </div>

                <div class="row mb-3">
                    <label for="fabricante" class="col-form-label col-sm-2">Fabricante</label>
                    <div class="col-sm-4"><input type="text" name="fabricante" id="fabricante" class="form-control" value="${param.fabricante}"></div>
                        <%
                            if(errores != null && errores.containsKey("fabricante")){
                                 out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("fabricante") + "</small>");
                            }
                        %>
                </div>

                <div class="row mb-3">
                    <label for="categoria" class="col-form-label col-sm-2">Categorías</label>
                    <div class="col-sm-4">
                        <select name="categoria" id="categoria" class="form-select">
                            <option value="">-- seleccionar --</option>
                            <option value="1" ${param.categorias.equals("1")? "selected": ""}>Deporte</option>
                            <option value="2" ${param.categorias.equals("2")? "selected": ""}>Computación</option>
                            <option value="3" ${param.categorias.equals("3")? "selected": ""}>Electrodomésticos</option>
                            <option value="4" ${param.categorias.equals("4")? "selected": ""}>Linea Blanca</option>
                            <option value="5" ${param.categorias.equals("5")? "selected": ""}>Ropa</option>
                            <option value="6" ${param.categorias.equals("6")? "selected": ""}>Tecnología</option>
                        </select>
                    </div>
                    <%
                        if(errores != null && errores.containsKey("categoria")){
                             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("categoria") + "</small>");
                        }
                    %>
                </div>

                <div class="row mb-3">
                    <div>
                        <input type="submit" value="Enviar" class="btn btn-primary">
                    </div>
                </div>

            </form>
        </div>
    </body>
</html>