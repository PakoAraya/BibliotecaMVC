package com.servlets;

import com.dao.AutorDAO;
import com.dto.AutorDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AutorServlet")
public class AutorServlet extends HttpServlet {

    private final AutorDAO autorDAO = new AutorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("list".equals(action)) {
                // Obtener la lista de autores
                List<AutorDTO> autores = autorDAO.traerTodosAutores();
                request.setAttribute("autores", autores);
                request.getRequestDispatcher("listarAutores.jsp").forward(request, response);

            } else if ("get".equals(action)) {
                // Obtener un autor por ID para edición
                int idAutor = Integer.parseInt(request.getParameter("id"));
                AutorDTO autor = autorDAO.traerAutorPorId(idAutor);
                request.setAttribute("autor", autor);
                request.getRequestDispatcher("formAutor.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                // Eliminar un autor
                int idAutor = Integer.parseInt(request.getParameter("id"));
                autorDAO.eliminarAutor(idAutor);
                response.sendRedirect("AutorServlet?action=list");

            } else {
                // Acción por defecto: listar autores
                response.sendRedirect("AutorServlet?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                // Crear un nuevo autor
                AutorDTO autor = new AutorDTO();
                autor.setNombre(request.getParameter("nombre"));
                autor.setApellido(request.getParameter("apellido"));
                autor.setGenero(request.getParameter("genero"));
                autor.setEspecialidad(request.getParameter("especialidad"));

                autorDAO.agregarAutor(autor);
                response.sendRedirect("AutorServlet?action=list");

            } else if ("update".equals(action)) {
                // Actualizar un autor existente
                int idAutor = Integer.parseInt(request.getParameter("id"));
                AutorDTO autor = new AutorDTO();
                autor.setIdAutor(idAutor);
                autor.setNombre(request.getParameter("nombre"));
                autor.setApellido(request.getParameter("apellido"));
                autor.setGenero(request.getParameter("genero"));
                autor.setEspecialidad(request.getParameter("especialidad"));

                autorDAO.agregarAutor(autor); // Si existe otro método `actualizarAutor`, usarlo aquí
                response.sendRedirect("AutorServlet?action=list");

            } else {
                // Redirigir a la lista de autores por defecto
                response.sendRedirect("AutorServlet?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
