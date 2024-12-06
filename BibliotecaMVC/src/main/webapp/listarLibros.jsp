<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dto.LibroDTO" %>
<%@ page import="com.models.Autor" %>
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
    <a href="agregarLibro.jsp" class="btn btn-success mb-3">Agregar Nuevo Libro</a>
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
                // Se obtiene la lista de libros del atributo "libros"
                List<LibroDTO> libros = (List<LibroDTO>) request.getAttribute("libros");
                
                // Si la lista de libros no está vacía, se recorren para mostrar cada libro
                if (libros != null && !libros.isEmpty()) {
                    for (LibroDTO libro : libros) {
            %>
            <tr>
                <td><%= libro.getIdLibro() %></td> <!-- Muestra el ID del libro -->
                <td><%= libro.getIsbn() %></td>
                <td><%= libro.getTitulo() %></td>
                <td><%= libro.getAnioPublicacion() %></td>
                <td><%= libro.getGenero() %></td>
                <td><%= libro.getEditorial() %></td>
                <td><%= libro.getAutor() != null ? (libro.getAutor().getNombre() + " " + libro.getAutor().getApellido()) : "Sin autor" %></td>
                <td>
                    <!-- Botones de editar y eliminar, con las URLs correctas para llamar a las acciones en el servlet -->
                    <a href="LibroServlet?action=get&id=<%= libro.getIdLibro() %>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="LibroServlet?action=delete&id=<%= libro.getIdLibro() %>" class="btn btn-danger btn-sm">Eliminar</a>
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
