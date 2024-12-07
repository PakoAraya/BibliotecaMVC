
/*********************************************************
SCRIPT EJERCICIO REPASO BIBLIOTECA | MODULO 4
ALUMNO			  : Francisco Javier Araya Hernandez
FECHA				  : 3/12/2024
MOTOR BBDD	  : POSTGRESQL 16.4
HOSTING BBDD	: AIVEN.IO
*********************************************************/
/*********************************************************
DESCRIPCION:
Breve Script de base de datos con el fin de practicar el
patron MVC en base a un escenario real de trabajo considerando
principios SOLID y buenas practicas en SQL y Java.
*********************************************************/

/*********************************************************
SCRIPT CREACION DE ENTIDADES DE LA BASE DE DATOS
*********************************************************/
CREATE TABLE autores(
	id_autor 	SERIAL PRIMARY KEY,
	nombre 		varchar(100),
	apellido	varchar(100),
	genero		varchar(50),
	especialidad	varchar(100)
);

CREATE TABLE libros(
	id_libro					SERIAL PRIMARY KEY,
	isbn							varchar(20),
	titulo						varchar(200),
	anio_publicacion	int,
	genero 						varchar(100),
	editorial					varchar(100),
	id_autor 					int,
	FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
);

INSERT INTO autores (nombre, apellido, genero, especialidad) VALUES
('Gabriel', 'García Márquez', 'Masculino', 'Novela'),
('Isabel', 'Allende', 'Femenino', 'Novela'),
('J.K.', 'Rowling', 'Femenino', 'Fantasía'),
('George', 'Orwell', 'Masculino', 'Distopía'),
('Jane', 'Austen', 'Femenino', 'Romance'),
('Mark', 'Twain', 'Masculino', 'Aventura'),
('Harper', 'Lee', 'Femenino', 'Drama'),
('F. Scott', 'Fitzgerald', 'Masculino', 'Novela'),
('Ernest', 'Hemingway', 'Masculino', 'Ficción'),
('Toni', 'Morrison', 'Femenino', 'Ficción');

INSERT INTO libros (isbn, titulo, anio_publicacion, genero, editorial, id_autor) VALUES
('978-3-16-148410-0', 'Cien años de soledad', 1967, 'Novela', 'Editorial Sudamericana', 1),
('978-3-16-148410-1', 'El otoño del patriarca', 1975, 'Novela', 'Editorial Sudamericana', 1),
('978-3-16-148410-2', 'Crónica de una muerte anunciada', 1981, 'Novela', 'Editorial Sudamericana', 1),

('978-3-16-148410-3', 'La casa de los espíritus', 1982, 'Novela', 'Editorial Plaza & Janés', 2),
('978-3-16-148410-4', 'Eva Luna', 1987, 'Novela', 'Editorial Plaza & Janés', 2),
('978-3-16-148410-5', 'Paula', 1994, 'Memorias', 'Sudamericana', 2),

('978-3-16-148410-6', 'Harry Potter y la piedra filosofal', 1997, 'Fantasía', 'Bloomsbury', 3),
('978-3-16-148410-7', 'Harry Potter y la cámara secreta', 1998, 'Fantasía', 'Bloomsbury', 3),
('978-3-16-148410-8', 'Harry Potter y el prisionero de Azkaban', 1999, 'Fantasía', 'Bloomsbury', 3),

('978-3-16-148410-9', '1984', 1949, 'Distopía', 'Secker & Warburg', 4),
('978-3-16-148411-0', 'Rebelión en la granja', 1945, 'Fábula', 'Secker & Warburg', 4),
('978-3-16-148411-1', 'Homenaje a Cataluña', 1938, 'No ficción', 'Secker & Warburg', 4),

('978-3-16-148411-2', 'Orgullo y prejuicio', 1813, 'Romance', 'T. Egerton', 5),
('978-3-16-148411-3', 'Sentido y sensibilidad', 1811, 'Romance', 'T. Egerton', 5),
('978-3-16-148411-4', 'Emma', 1815, 'Romance', 'T. Egerton', 5),

('978-3-16-148411-5', 'Las aventuras de Tom Sawyer', 1876, 'Aventura', 'Chatto & Windus', 6),
('978-3-16-148411-6', 'Las aventuras de Huckleberry Finn', 1884, 'Aventura', 'Chatto & Windus', 6),
('978-3-16-148411-7', 'El príncipe y el mendigo', 1881, 'Aventura', 'Chatto & Windus', 6),

('978-3-16-148411-8', 'Matar a un ruiseñor', 1960, 'Drama', 'J.B. Lippincott & Co.', 7),
('978-3-16-148411-9', 'Ve y pon un centinela', 2015, 'Drama', 'HarperCollins', 7),
('978-3-16-148412-0', 'El camino de regreso', 1960, 'Drama', 'J.B. Lippincott & Co.', 7),

('978-3-16-148412-1', 'El gran Gatsby', 1925, 'Novela', 'Charles Scribner''s Sons', 8),
('978-3-16-148412-2', 'Suave es la noche', 1934, 'Novela', 'Charles Scribner''s Sons', 8),
('978-3-16-148412-3', 'Los hermosos y los malditos', 1922, 'Novela', 'Charles Scribner''s Sons', 8),

('978-3-16-148412-4', 'El viejo y el mar', 1952, 'Ficción', 'Charles Scribner''s Sons', 9),
('978-3-16-148412-5', 'Por quien doblan las campanas ', 1940, 'Ficción', 'Charles Scribner''s Sons', 9),
('978-3-16-148412-6', 'El jardín del Edén', 1986, 'Ficción', 'Charles Scribner''s Sons', 9),

('978-3-16-148412-7', 'El alquimista', 1988, 'Ficción', 'Editorial Planeta', 10),
('978-3-16-148412-8', 'Brida', 1990, 'Ficción', 'Editorial Planeta', 10),
('978-3-16-148412-9', 'Veronika decide morir', 1998, 'Ficción', 'Editorial Planeta', 10);

SELECT *
FROM autores a;

SELECT *
FROM libros l;





