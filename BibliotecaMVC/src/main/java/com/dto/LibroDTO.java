package com.dto;

import com.models.Autor;
import com.models.Libro;

public class LibroDTO {
	private int idLibro;
    private String isbn;
    private String titulo;
    private int anioPublicacion;
    private String genero;
    private String editorial;
    private Autor autor; // Cambiado de idAutor a Autor
    
    //Constructor sin parametros
    public LibroDTO() {
    	
    }

    // Constructor que toma una instancia de Libro
    public LibroDTO(Libro libro) {
    	this.idLibro = libro.getIdLibro();  // Agregar esta línea para asignar el ID
        this.isbn = libro.getIsbn();
        this.titulo = libro.getTitulo();
        this.anioPublicacion = libro.getAnioPublicacion();
        this.genero = libro.getGenero();
        this.editorial = libro.getEditorial();
        this.autor = libro.getAutor(); // Asignación del objeto Autor
    }

    // Getters y Setters
    public int getIdLibro() {
        return idLibro; 
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro; 
    }
    
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAnioPublicacion() {
        return anioPublicacion;
    }

    public void setAnioPublicacion(int anioPublicacion) {
        this.anioPublicacion = anioPublicacion;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public Autor getAutor() {
        return autor; // Cambiado para devolver el objeto Autor
    }

    public void setAutor(Autor autor) {
        this.autor = autor; // Cambiado para asignar el objeto Autor
    }

    // Método toString
    @Override
    public String toString() {
        return "LibroDTO [isbn=" + isbn + ", titulo=" + titulo + ", anioPublicacion=" + anioPublicacion + ", genero=" + genero
                + ", editorial=" + editorial + ", autor=" + autor + "]";
    }
}