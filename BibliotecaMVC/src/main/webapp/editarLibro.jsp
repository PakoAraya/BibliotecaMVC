<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dto.LibroDTO" %>
<%@ page import="com.dto.AutorDTO" %>
<%@ page import="java.util.List" %>
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
        LibroDTO libro = (LibroDTO) request.getAttribute("libro");
        List<AutorDTO> autores = (List<AutorDTO>) request.getAttribute("autores");
        
        if (libro == null) {
    %>
        <div class="alert alert-danger" role="alert">
            No se encontró el libro solicitado. 
            <a href="LibroServlet?action=list" class="alert-link">Volver a la lista de libros</a>
        </div>
    <%
        } else {
    %>
        <form action="LibroServlet" method="post">
            <input type="hidden" name="action" value="update">
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
                <input type="number" class="form-control" id="anio_publicacion" name="anio_publicacion" 
                       value="<%= libro.getAnioPublicacion() %>" required>
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
                <label for="id_autor" class="form-label">Autor</label>
                <select class="form-control" id="id_autor" name="id_autor" required>
                    <% if (autores != null) {
                        for (AutorDTO autor : autores) { %>
                            <option value="<%= autor.getIdAutor() %>" 
                                    <%= libro.getAutor().getIdAutor() == autor.getIdAutor() ? "selected" : "" %>>
                                <%= autor.getNombre() + " " + autor.getApellido() %>
                            </option>
                    <%  }
                    } %>
                </select>
            </div>
            
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Actualizar Libro</button>
                <a href="LibroServlet?action=list" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>