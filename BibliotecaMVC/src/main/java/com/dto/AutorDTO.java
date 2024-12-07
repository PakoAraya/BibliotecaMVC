package com.dto;

import com.models.Autor;

public class AutorDTO {
	private int idAutor;
    private String nombre;
    private String apellido;
    private String genero;
    private String especialidad;
    
    //Constructor vacio de la clase
    public AutorDTO() {
    	
    }
    
    // Constructor completo
    public AutorDTO(int idAutor, String nombre, String apellido, String genero, String especialidad) {
        this.idAutor = idAutor;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.especialidad = especialidad;
    }
    
    //Constructor que toma instancia de Autor
    public AutorDTO(Autor autor) {
    	this.idAutor = autor.getIdAutor();
    	this.nombre = autor.getNombre();
    	this.apellido = autor.getApellido();
    	this.genero = autor.getGenero();
    	this.especialidad = autor.getEspecialidad();
    }

    //Getters y Setters
	public int getIdAutor() {
		return idAutor;
	}

	public void setIdAutor(int idAutor) {
		this.idAutor = idAutor;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getEspecialidad() {
		return especialidad;
	}

	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}

	//Metodo toString
	@Override
	public String toString() {
		return "AutorDTO [idAutor=" + idAutor + ", nombre=" + nombre + ", apellido=" + apellido + ", genero=" + genero
				+ ", especialidad=" + especialidad + "]";
	}
}