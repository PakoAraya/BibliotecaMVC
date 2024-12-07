<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dto.LibroDTO" %>
<%@ page import="com.dto.AutorDTO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Lista de Libros</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Lista de Libros</h2>
    <a href="LibroServlet?action=add" class="btn btn-success mb-3">Agregar Nuevo Libro</a>
    <a href="LogoutServlet" class="btn btn-danger mb-3">Cerrar Sesión</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>ISBN</th>
                <th>Título</th>
                <th>Año de Publicación</th>
                <th>Género</th>
                <th>Editorial</th>
                <th>Autor</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<LibroDTO> libros = (List<LibroDTO>) request.getAttribute("libros");
                if (libros != null && !libros.isEmpty()) {
                    for (LibroDTO libro : libros) {
                        AutorDTO autor = libro.getAutor();
            %>
            <tr>
                <td><%= libro.getIdLibro() %></td>
                <td><%= libro.getIsbn() %></td>
                <td><%= libro.getTitulo() %></td>
                <td><%= libro.getAnioPublicacion() %></td>
                <td><%= libro.getGenero() %></td>
                <td><%= libro.getEditorial() %></td>
                <td><%= autor != null ? (autor.getNombre() + " " + autor.getApellido()) : "Sin autor" %></td>
                <td>
                    <a href="LibroServlet?action=get&id=<%= libro.getIdLibro() %>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="LibroServlet?action=delete&id=<%= libro.getIdLibro() %>" 
                       class="btn btn-danger btn-sm" 
                       onclick="return confirm('¿Está seguro de eliminar este libro?')">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="8" class="text-center">No hay libros disponibles.</td>
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