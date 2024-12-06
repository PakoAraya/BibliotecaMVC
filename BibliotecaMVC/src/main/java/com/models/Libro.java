package com.models;

import java.util.concurrent.TimeUnit;

public class Libro {
	private int idLibro;
	private String isbn;
	private String titulo;
	private int anioPublicacion;
	private String genero;
	private String editorial;
	private Autor autor;
	
	//Constructor vacio
	public Libro() {
		
	}
	
	//Constructor de la clase
	public Libro(int idLibro, String isbn, String titulo, int anioPublicacion, String genero, String editorial, Autor autor) {
		this.idLibro = idLibro;
		this.isbn = isbn;
		this.titulo = titulo;
		this.anioPublicacion = anioPublicacion;
		this.genero = genero;
		this.editorial = editorial;
		this.autor = autor;
	}
	
	//Getters y Setters de la clase
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
		return autor;
	}
	
	public void setAutor(Autor autor) {
		this.autor = autor;
	}

	//Metodo toString
	@Override
	public String toString() {
		return "Libro [idLibro=" + idLibro + ", isbn=" + isbn + ", titulo=" + titulo + ", anioPublicacion="
				+ anioPublicacion + ", genero=" + genero + ", editorial=" + editorial + ", autor=" + autor + "]";
	}
}
