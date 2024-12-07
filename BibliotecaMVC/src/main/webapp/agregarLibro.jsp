<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dto.AutorDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Agregar Nuevo Libro</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Agregar Nuevo Libro</h2>
    
    <form action="LibroServlet" method="post">
        <input type="hidden" name="action" value="add">
        
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
            <label for="id_autor" class="form-label">Autor</label>
            <div class="d-flex">
                <select class="form-control me-2" id="id_autor" name="id_autor" required>
                    <option value="">Seleccione un autor</option>
                    <% 
                    List<AutorDTO> autores = (List<AutorDTO>) request.getAttribute("autores");
                    if (autores != null) {
                        for (AutorDTO autor : autores) { 
                    %>
                        <option value="<%= autor.getIdAutor() %>">
                            <%= autor.getNombre() + " " + autor.getApellido() %>
                        </option>
                    <%  
                        }
                    } 
                    %>
                </select>
                <!-- Botón para abrir el modal -->
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#nuevoAutorModal">
                    Agregar Autor
                </button>
            </div>
        </div>
        
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Guardar Libro</button>
            <a href="LibroServlet?action=list" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>

<!-- Modal para agregar un nuevo autor -->
<div class="modal fade" id="nuevoAutorModal" tabindex="-1" aria-labelledby="nuevoAutorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="AutorServlet" method="post" id="formNuevoAutor">
                <input type="hidden" name="action" value="add">
                <div class="modal-header">
                    <h5 class="modal-title" id="nuevoAutorModalLabel">Agregar Nuevo Autor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="nombreAutor" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombreAutor" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellidoAutor" class="form-label">Apellido</label>
                        <input type="text" class="form-control" id="apellidoAutor" name="apellido" required>
                    </div>
                    <div class="mb-3">
                        <label for="generoAutor" class="form-label">Género</label>
                        <select class="form-control" id="generoAutor" name="genero" required>
                            <option value="">Seleccione el género</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="especialidadAutor" class="form-label">Especialidad</label>
                        <input type="text" class="form-control" id="especialidadAutor" name="especialidad" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Actualiza el select de autores al cerrar el modal (simulación)
    document.getElementById('formNuevoAutor').addEventListener('submit', function (e) {
        e.preventDefault(); // Evita recargar la página
        const nombre = document.getElementById('nombreAutor').value;
        const apellido = document.getElementById('apellidoAutor').value;
        const nuevoId = Date.now(); // Simulación de ID único
        const nuevoOption = new Option(`${nombre} ${apellido}`, nuevoId);
        document.getElementById('id_autor').add(nuevoOption);
        document.getElementById('id_autor').value = nuevoId;
        const modal = bootstrap.Modal.getInstance(document.getElementById('nuevoAutorModal'));
        modal.hide();
    });
</script>
</body>
</html>
