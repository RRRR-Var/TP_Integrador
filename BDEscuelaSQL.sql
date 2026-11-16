create schema BD_Escuela;

create table Alumnos (
idAlumno INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
apellido VARCHAR(45),
fkCurso INT,
fkCentro INT
);

create table Profesores (
idProfe INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
apellido VARCHAR(45)
);

create table Curso (
idCurso INT NOT NULL PRIMARY KEY,
año INT,
division INT,
fkProfesor INT
);

create table CentroDeEstudiantes (
idCentro INT NOT NULL PRIMARY KEY,
fkPresidente INT,
fkTesorero INT
);

