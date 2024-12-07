package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.LibroDTO;
import com.dto.AutorDTO;
import com.models.Autor;
import com.models.Libro;
import com.utils.AppConfig;
import com.utils.DatabaseUtil;

public class LibroDAO {

    //Metodo para obtener todos los libros de la base de datos
    public List<LibroDTO> traerTodosLibros() {
        List<LibroDTO> libroDTOList = new ArrayList<>();
        AppConfig.initialize();
        
        String query = "SELECT l.*, a.nombre AS nombre_autor, a.apellido AS apellido_autor "
                    + "FROM libros l JOIN autores a ON l.id_autor = a.id_autor";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            
            while(rs.next()) {
                Libro libro = new Libro();
                libro.setIdLibro(rs.getInt("id_libro"));
                libro.setIsbn(rs.getString("isbn"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setAnioPublicacion(rs.getInt("anio_publicacion"));
                libro.setGenero(rs.getString("genero"));
                libro.setEditorial(rs.getString("editorial"));
                
                Autor autor = new Autor();
                autor.setIdAutor(rs.getInt("id_autor"));
                autor.setNombre(rs.getString("nombre_autor"));
                autor.setApellido(rs.getString("apellido_autor"));
                libro.setAutor(autor);
                
                libroDTOList.add(new LibroDTO(libro));
            }
        } catch (SQLException e) {
            System.err.println("Error al traer los libros: " + e.getMessage());
        }
        return libroDTOList;
    }
    
    //Metodo para obtener un libro por ID
    public LibroDTO traerLibroPorId(int idLibro) {
        LibroDTO libroDTO = null;
        AppConfig.initialize();
        
        String query = "SELECT l.*, a.id_autor, a.nombre AS nombre_autor, a.apellido AS apellido_autor, "
                    + "a.genero AS genero_autor, a.especialidad "
                    + "FROM libros l "
                    + "JOIN autores a ON l.id_autor = a.id_autor "
                    + "WHERE l.id_libro = ?";
                    
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            
            pstmt.setInt(1, idLibro);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) {
                Libro libro = new Libro();
                libro.setIdLibro(rs.getInt("id_libro"));
                libro.setIsbn(rs.getString("isbn"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setAnioPublicacion(rs.getInt("anio_publicacion"));
                libro.setGenero(rs.getString("genero"));
                libro.setEditorial(rs.getString("editorial"));
                
                Autor autor = new Autor();
                autor.setIdAutor(rs.getInt("id_autor"));
                autor.setNombre(rs.getString("nombre_autor"));
                autor.setApellido(rs.getString("apellido_autor"));
                autor.setGenero(rs.getString("genero_autor"));
                autor.setEspecialidad(rs.getString("especialidad"));
                libro.setAutor(autor);
                
                libroDTO = new LibroDTO(libro);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el libro: " + e.getMessage());
        }
        return libroDTO;
    }
    
    //Metodo para agregar un nuevo libro
    public void agregarLibro(LibroDTO libroDTO) {
        AppConfig.initialize();
        
        String query = "INSERT INTO libros (isbn, titulo, anio_publicacion, genero, editorial, id_autor) VALUES (?,?,?,?,?,?);";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            
            pstmt.setString(1, libroDTO.getIsbn());
            pstmt.setString(2, libroDTO.getTitulo());
            pstmt.setInt(3, libroDTO.getAnioPublicacion());
            pstmt.setString(4, libroDTO.getGenero());
            pstmt.setString(5, libroDTO.getEditorial());
            pstmt.setInt(6, libroDTO.getAutor().getIdAutor());
            
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Error al agregar libro: " + e.getMessage());
        }
    }
    
    // Método para actualizar un libro existente
    public void actualizarLibro(LibroDTO libroDTO) {
        AppConfig.initialize();
        
        String query = "UPDATE libros SET isbn = ?, titulo = ?, anio_publicacion = ?, genero = ?, editorial = ?, id_autor = ? WHERE id_libro = ?;";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            
            pstmt.setString(1, libroDTO.getIsbn());
            pstmt.setString(2, libroDTO.getTitulo());
            pstmt.setInt(3, libroDTO.getAnioPublicacion());
            pstmt.setString(4, libroDTO.getGenero());
            pstmt.setString(5, libroDTO.getEditorial());
            pstmt.setInt(6, libroDTO.getAutor().getIdAutor());
            pstmt.setInt(7, libroDTO.getIdLibro());
            
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Error al actualizar libro: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    //Metodo para eliminar un libro
    public void eliminarLibro(int idLibro) {
        AppConfig.initialize();
        
        String query = "DELETE FROM libros WHERE id_libro = ?;";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            
            pstmt.setInt(1, idLibro);
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Error al eliminar libro: " + e.getMessage());
        }
    }
}