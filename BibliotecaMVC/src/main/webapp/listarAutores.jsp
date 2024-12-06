<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dto.AutorDTO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Autores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Lista de Autores</h1>

        <div class="mb-3">
            <a href="formAutor.jsp" class="btn btn-primary">Nuevo Autor</a>
        </div>

        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Género</th>
                    <th>Especialidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Obtención de la lista de autores desde el request
                    List<AutorDTO> autores = (List<AutorDTO>) request.getAttribute("autores");
                    if (autores != null && !autores.isEmpty()) {
                        for (AutorDTO autor : autores) {
                %>
                            <tr>
                                <td><%= autor.getIdAutor() %></td>
                                <td><%= autor.getNombre() %></td>
                                <td><%= autor.getApellido() %></td>
                                <td><%= autor.getGenero() %></td>
                                <td><%= autor.getEspecialidad() %></td>
                                <td>
                                    <a href="AutorServlet?action=get&id=<%= autor.getIdAutor() %>" 
                                       class="btn btn-warning btn-sm">Editar</a>
                                    <a href="AutorServlet?action=delete&id=<%= autor.getIdAutor() %>" 
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('¿Está seguro de eliminar este autor?')">
                                        Eliminar
                                    </a>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="6" class="text-center">No hay autores disponibles.</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
