package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.dao.AutorDAO;
import com.dao.LibroDAO;
import com.dto.LibroDTO;
import com.dto.AutorDTO;

@WebServlet("/LibroServlet")
public class LibroServlet extends HttpServlet {

    private final LibroDAO libroDAO = new LibroDAO();
    private final AutorDAO autorDAO = new AutorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Obtener la lista de autores y pasarla a la vista
            List<AutorDTO> autores = autorDAO.traerTodosAutores();
            request.setAttribute("autores", autores);
            request.getRequestDispatcher("agregarLibro.jsp").forward(request, response);
        } else if ("list".equals(action)) {
            List<LibroDTO> libros = libroDAO.traerTodosLibros();
            request.setAttribute("libros", libros);
            request.getRequestDispatcher("listarLibros.jsp").forward(request, response);
        } else if ("get".equals(action)) {
            try {
                int idLibro = Integer.parseInt(request.getParameter("id"));
                LibroDTO libro = libroDAO.traerLibroPorId(idLibro);
                List<AutorDTO> autores = autorDAO.traerTodosAutores();
                request.setAttribute("libro", libro);
                request.setAttribute("autores", autores);
                request.getRequestDispatcher("editarLibro.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect("LibroServlet?action=list");
            }
        } else if ("delete".equals(action)) {
            int idLibro = Integer.parseInt(request.getParameter("id"));
            libroDAO.eliminarLibro(idLibro);
            response.sendRedirect("LibroServlet?action=list");
        } else {
            response.sendRedirect("LibroServlet?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Agregar un nuevo libro
            LibroDTO libroDTO = new LibroDTO();
            libroDTO.setIsbn(request.getParameter("isbn"));
            libroDTO.setTitulo(request.getParameter("titulo"));
            libroDTO.setAnioPublicacion(Integer.parseInt(request.getParameter("anio_publicacion")));
            libroDTO.setGenero(request.getParameter("genero"));
            libroDTO.setEditorial(request.getParameter("editorial"));
            
            // Crear AutorDTO con el ID seleccionado
            AutorDTO autorDTO = new AutorDTO();
            autorDTO.setIdAutor(Integer.parseInt(request.getParameter("id_autor")));
            libroDTO.setAutor(autorDTO);

            libroDAO.agregarLibro(libroDTO);
            response.sendRedirect("LibroServlet?action=list");
        } else if ("update".equals(action)) {
            // Actualizar un libro existente
            try {
                LibroDTO libroDTO = new LibroDTO();
                libroDTO.setIdLibro(Integer.parseInt(request.getParameter("id")));
                libroDTO.setIsbn(request.getParameter("isbn"));
                libroDTO.setTitulo(request.getParameter("titulo"));
                libroDTO.setAnioPublicacion(Integer.parseInt(request.getParameter("anio_publicacion")));
                libroDTO.setGenero(request.getParameter("genero"));
                libroDTO.setEditorial(request.getParameter("editorial"));
                
                // Crear AutorDTO con el ID seleccionado
                AutorDTO autorDTO = new AutorDTO();
                autorDTO.setIdAutor(Integer.parseInt(request.getParameter("id_autor")));
                libroDTO.setAutor(autorDTO);

                libroDAO.actualizarLibro(libroDTO);
                response.sendRedirect("LibroServlet?action=list");
            } catch (NumberFormatException e) {
                response.sendRedirect("LibroServlet?action=list");
            }
        }
    }
}