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
    <title>Agregar Libro</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Agregar Nuevo Libro</h2>
    <form action="LibroServlet?action=add" method="post">
        <div class="mb-3">
            <label for="isbn" class="form-label">ISBN</label>
            <input type="text" class="form-control" id="isbn" name="isbn" required>
        </div>
        <div class="mb-3">
            <label for="titulo" class="form-label">Título</label>
            <input type="text" class="form-control" id="titulo" name="titulo" required>
        </div>
        <div class="mb-3">
            <label for="anio_publicacion" class="form-label">Año de Publicación</label>
            <input type="number" class="form-control" id="anio_publicacion" name="anio_publicacion" required>
        </div>
        <div class="mb-3">
            <label for="genero" class="form-label">Género</label>
            <input type="text" class="form-control" id="genero" name="genero" required>
        </div>
        <div class="mb-3">
            <label for="editorial" class="form-label">Editorial</label>
            <input type="text" class="form-control" id="editorial" name="editorial" required>
        </div>
        <div class="mb-3">
            <label for="id_autor" class="form-label">Seleccionar Autor</label>
            <select class="form-control" id="id_autor" name="id_autor" required>
                <option value="">Seleccione un autor</option>
                <% 
                    List<Autor> autores = (List<Autor>) request.getAttribute("autores"); 
                    if (autores != null && !autores.isEmpty()) {
                        for (Autor autor : autores) {
                %>
                    <option value="<%= autor.getIdAutor() %>">
                        <%= autor.getNombre() + " " + autor.getApellido() %>
                    </option>
                <% 
                        }
                    } 
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Agregar Libro</button>
        <a href="agregarAutor.jsp" class="btn btn-primary">Agregar Nuevo Autor</a>
        <a href="listarLibros.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
