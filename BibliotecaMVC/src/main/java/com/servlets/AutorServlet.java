package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.dao.AutorDAO;
import com.dto.AutorDTO;

@WebServlet("/AutorServlet")
public class AutorServlet extends HttpServlet {

    private final AutorDAO autorDAO = new AutorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            // Obtener lista de autores
            List<AutorDTO> autores = autorDAO.traerTodosAutores();
            request.setAttribute("autores", autores);
            request.getRequestDispatcher("listarAutores.jsp").forward(request, response);

        } else if ("get".equals(action)) {
            try {
                // Obtener autor por ID para editar
                int idAutor = Integer.parseInt(request.getParameter("id"));
                AutorDTO autor = autorDAO.traerAutorPorId(idAutor);
                request.setAttribute("autor", autor);
                request.getRequestDispatcher("formAutor.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect("AutorServlet?action=list");
            }

        } else if ("delete".equals(action)) {
            try {
                // Eliminar autor por ID
                int idAutor = Integer.parseInt(request.getParameter("id"));
                autorDAO.eliminarAutor(idAutor);
                response.sendRedirect("AutorServlet?action=list");
            } catch (NumberFormatException e) {
                response.sendRedirect("AutorServlet?action=list");
            }

        } else {
            // Acción por defecto
            response.sendRedirect("AutorServlet?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Crear un nuevo autor
            AutorDTO autorDTO = new AutorDTO();
            autorDTO.setNombre(request.getParameter("nombre"));
            autorDTO.setApellido(request.getParameter("apellido"));
            autorDTO.setGenero(request.getParameter("genero"));
            autorDTO.setEspecialidad(request.getParameter("especialidad"));

            autorDAO.agregarAutor(autorDTO);
            response.sendRedirect("AutorServlet?action=list");

        } else if ("update".equals(action)) {
            try {
                // Actualizar un autor existente
                AutorDTO autorDTO = new AutorDTO();
                autorDTO.setIdAutor(Integer.parseInt(request.getParameter("id")));
                autorDTO.setNombre(request.getParameter("nombre"));
                autorDTO.setApellido(request.getParameter("apellido"));
                autorDTO.setGenero(request.getParameter("genero"));
                autorDTO.setEspecialidad(request.getParameter("especialidad"));

                autorDAO.agregarAutor(autorDTO); // Actualizar usando el DAO
                response.sendRedirect("AutorServlet?action=list");

            } catch (NumberFormatException e) {
                response.sendRedirect("AutorServlet?action=list");
            }
        }
    }
}
