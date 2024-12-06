<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dto.AutorDTO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Autor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <% 
            AutorDTO autor = (AutorDTO) request.getAttribute("autor");
            boolean esEdicion = autor != null;
        %>
        <h1 class="mb-4"><%= esEdicion ? "Editar" : "Nuevo" %> Autor</h1>
        
        <form action="AutorServlet" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="action" value="<%= esEdicion ? "update" : "add" %>">
            <% if (esEdicion) { %>
                <input type="hidden" name="id" value="<%= autor.getIdAutor() %>">
            <% } %>
            
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" 
                       value="<%= esEdicion ? autor.getNombre() : "" %>" required>
            </div>
            
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido" 
                       value="<%= esEdicion ? autor.getApellido() : "" %>" required>
            </div>
            
            <div class="mb-3">
                <label for="genero" class="form-label">Género</label>
                <select class="form-select" id="genero" name="genero" required>
                    <option value="">Seleccione un género</option>
                    <option value="Masculino" <%= esEdicion && "Masculino".equals(autor.getGenero()) ? "selected" : "" %>>
                        Masculino
                    </option>
                    <option value="Femenino" <%= esEdicion && "Femenino".equals(autor.getGenero()) ? "selected" : "" %>>
                        Femenino
                    </option>
                </select>
            </div>
            
            <div class="mb-3">
                <label for="especialidad" class="form-label">Especialidad</label>
                <input type="text" class="form-control" id="especialidad" name="especialidad" 
                       value="<%= esEdicion ? autor.getEspecialidad() : "" %>" required>
            </div>
            
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Guardar</button>
                <a href="AutorServlet?action=list" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validación del formulario
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>