package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.dao.AutorDAO; // Asegúrate de que esta importación sea correcta
import com.dao.LibroDAO;
import com.dto.LibroDTO;
import com.dto.AutorDTO; // Asegúrate de importar el DTO correcto

@WebServlet("/LibroServlet")
public class LibroServlet extends HttpServlet {

    private final LibroDAO libroDAO = new LibroDAO();
    private final AutorDAO autorDAO = new AutorDAO(); // Declarar la instancia de AutorDAO

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Obtener la lista de autores y pasarla a la vista
            List<AutorDTO> autores = autorDAO.traerTodosAutores(); // Cambiar a AutorDTO
            request.setAttribute("autores", autores);
            request.getRequestDispatcher("agregarLibro.jsp").forward(request, response);
        } else if ("list".equals(action)) {
            List<LibroDTO> libros = libroDAO.traerTodosLibros();
            request.setAttribute("libros", libros);
            request.getRequestDispatcher("listarLibros.jsp").forward(request, response);
        } else if ("get".equals(action)) {
            int idLibro = Integer.parseInt(request.getParameter("id"));
            LibroDTO libro = libroDAO.traerLibroPorId(idLibro);
            request.setAttribute("libro", libro);
            request.getRequestDispatcher("editarLibro.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int idLibro = Integer.parseInt(request.getParameter("id"));
            libroDAO.eliminarLibro(idLibro);
            response.sendRedirect("LibroServlet?action=list");
        } else {
            response.sendRedirect("LibroServlet?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}