package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.AutorDTO;
import com.models.Autor;
import com.utils.AppConfig;
import com.utils.DatabaseUtil;

public class AutorDAO {
	
	//Metodo para obtener todos los autores de la base de datos
	public List<AutorDTO> traerTodosAutores(){
		List<AutorDTO> autorDTOList = new ArrayList<>();
		AppConfig.initialize();
		
		String query = "SELECT * FROM autores";
		try (Connection connection = DatabaseUtil.getConnection();
			 PreparedStatement pstmt = connection.prepareStatement(query);
			 ResultSet rs = pstmt.executeQuery()){
			
			while(rs.next()) {
				Autor autor = new Autor();
				autor.setIdAutor(rs.getInt("id_autor"));
				autor.setNombre(rs.getString("nombre"));
				autor.setApellido(rs.getString("apellido"));
				autor.setGenero(rs.getString("genero"));
				autor.setEspecialidad(rs.getString("especialidad"));
				
				//Ahora cargamos la data dentro de autorDTO
				autorDTOList.add(new AutorDTO(autor));
			}
			
		} catch (SQLException e) {
			System.err.println("Error al traer los autores " + e.getMessage());
		}
		return autorDTOList;
	}
	
	//Metodo para obtener un autor por ID
	public AutorDTO traerAutorPorId(int idAutor) {
		AutorDTO autorDTO = null;
		AppConfig.initialize();
		
		String query = "SELECT * FROM autores WHERE id_autor = ?;";
		try (Connection connection = DatabaseUtil.getConnection();
			 PreparedStatement pstmt = connection.prepareStatement(query)){
			
			pstmt.setInt(1, idAutor);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Autor autor = new Autor();
				autor.setIdAutor(rs.getInt("id_autor"));
				autor.setNombre(rs.getString("nombre"));
				autor.setApellido(rs.getString("apellido"));
				autor.setGenero(rs.getString("genero"));
				autor.setEspecialidad(rs.getString("especialidad"));
				
				//Ahora llenamos a AutorDTO con los datos
				autorDTO = new AutorDTO(autor);
			}
			
		} catch (SQLException e) {
			System.err.println("Error al traer el autor " + e.getMessage());
		}
		return autorDTO;
	}
	
	//Metodo para agregar un nuevo autor
	public void agregarAutor(AutorDTO autorDTO) {
		AppConfig.initialize();
		
		String query = "INSERT INTO autores (nombre, apellido, genero, especialidad) VALUES (?,?,?,?);";
		try (Connection connection = DatabaseUtil.getConnection();
			 PreparedStatement pstmt = connection.prepareStatement(query)){
			
			pstmt.setString(1, autorDTO.getNombre());
			pstmt.setString(2, autorDTO.getApellido());
			pstmt.setString(3, autorDTO.getGenero());
			pstmt.setString(4, autorDTO.getEspecialidad());
			
			//Ahora damos la orden de ingreso a la base de datos
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.err.println("Error al agregar a autor " + e.getMessage());
		}
	}
	
	//Metodo para eliminar un autor
	public void eliminarAutor(int idAutor) {
		AppConfig.initialize();
		
		String query = "DELETE FROM autores WHERE id_autor = ?;";
		try (Connection connetion = DatabaseUtil.getConnection();
			 PreparedStatement pstmt = connetion.prepareStatement(query)){
			
			//Damos la orden para eliminar el registro de la base de datos
			pstmt.setInt(1, idAutor);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("Error al eliminar autor " + e.getMessage());
		}
	}
}
