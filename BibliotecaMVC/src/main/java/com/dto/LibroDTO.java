package com.dto;

import com.models.Libro;
import com.models.Autor;

public class LibroDTO {
    private int idLibro;
    private String isbn;
    private String titulo;
    private int anioPublicacion;
    private String genero;
    private String editorial;
    private AutorDTO autor; // Cambiado de Autor a AutorDTO
    
    //Constructor sin parametros
    public LibroDTO() {
    }

    // Constructor que toma una instancia de Libro
    public LibroDTO(Libro libro) {
        this.idLibro = libro.getIdLibro();
        this.isbn = libro.getIsbn();
        this.titulo = libro.getTitulo();
        this.anioPublicacion = libro.getAnioPublicacion();
        this.genero = libro.getGenero();
        this.editorial = libro.getEditorial();
        // Convertir Autor a AutorDTO
        if (libro.getAutor() != null) {
            this.autor = new AutorDTO(libro.getAutor());
        }
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

    public AutorDTO getAutor() {
        return autor;
    }

    public void setAutor(AutorDTO autor) {
        this.autor = autor;
    }

    // Método toString
    @Override
    public String toString() {
        return "LibroDTO [idLibro=" + idLibro + ", isbn=" + isbn + ", titulo=" + titulo + 
               ", anioPublicacion=" + anioPublicacion + ", genero=" + genero +
               ", editorial=" + editorial + ", autor=" + autor + "]";
    }
}