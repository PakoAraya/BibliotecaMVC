<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dto.LibroDTO" %>
<%@ page import="com.models.Autor" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Editar Libro</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Editar Libro</h2>
    <%
        // Obtener el objeto libro del contexto de la solicitud
        LibroDTO libro = (LibroDTO) request.getAttribute("libro");
        if (libro == null) {
            out.println("<div class='alert alert-danger'>No se encontró el libro.</div>");
            return; // Detener la ejecución del JSP
        }
    %>
    <form action="LibroServlet?action=update" method="post">
        <input type="hidden" name="id" value="<%= libro.getIdLibro() %>">
        <div class="mb-3">
            <label for="isbn" class="form-label">ISBN</label>
            <input type="text" class="form-control" id="isbn" name="isbn" value="<%= libro.getIsbn() %>" required>
        </div>
        <div class="mb-3">
            <label for="titulo" class="form-label">Título</label>
            <input type="text" class="form-control" id="titulo" name="titulo" value="<%= libro.getTitulo() %>" required>
        </div>
        <div class="mb-3">
            <label for="anio_publicacion" class="form-label">Año de Publicación</label>
            <input type="number" class="form-control" id="anio_publicacion" name="anio_publicacion" value="<%= libro.getAnioPublicacion() %>" required>
        </div>
        <div class="mb-3">
            <label for="genero" class="form-label">Género</label>
            <input type="text" class="form-control" id="genero" name="genero" value="<%= libro.getGenero() %>" required>
        </div>
        <div class="mb-3">
            <label for="editorial" class="form-label">Editorial</label>
            <input type="text" class="form-control" id="editorial" name="editorial" value="<%= libro.getEditorial() %>" required>
        </div>
        <div class="mb-3">
            <label for="id_autor" class="form-label">ID Autor</label>
            <input type="number" class="form-control" id="id_autor" name="id_autor" value="<%= libro.getAutor().getIdAutor() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Actualizar Libro</button>
        <a href="libros?action=list" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>