create schema BD_Escuela;

create table CentroDeEstudiantes (
idCentro INT NOT NULL PRIMARY KEY
);

create table Establecimiento (
idEst INT NOT NULL PRIMARY KEY,
idCentro INT,
CONSTRAINT fkCentro FOREIGN KEY (idCentro) REFERENCES CentroDeEstudiantes(idCentro)
);

create table Especialidades (
idEsp INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
idEst INT,
CONSTRAINT fkEst FOREIGN KEY (idEst) REFERENCES Establecimiento(idEst)
);

create table Preceptores (
idPrece INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
apellido VARCHAR(45)
);

create table Directores (
idDirec INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
apellido VARCHAR(45),
idEst INT,
CONSTRAINT fkEst2 FOREIGN KEY (idEst) REFERENCES Establecimiento(idEst)
);

create table Profesores (
idProfe INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
apellido VARCHAR(45)
);

create table Cursos (
idCurso INT NOT NULL PRIMARY KEY,
año INT NOT NULL,
division INT NULL,
idPrece INT,
CONSTRAINT fkPrece FOREIGN KEY (idPrece) REFERENCES Preceptores(idPrece)
);

create table Materias (
idMateria INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
idCurso INT,
idEsp INT,
idProfe INT,
CONSTRAINT fkCurso FOREIGN KEY (idCurso) REFERENCES Cursos(idCurso),
CONSTRAINT fkEspecialidades foreign key (idEsp) references Especialidades(idEsp),
CONSTRAINT fkProfe FOREIGN KEY (idProfe) REFERENCES Profesores(idProfe)
);

create table Alumnos (
idAlumno INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
apellido VARCHAR(45),
edad INT,
idCurso INT,
idCentro INT,
CONSTRAINT fkCurso2 FOREIGN KEY (idCurso) REFERENCES Cursos(idCurso),
CONSTRAINT fkCentro2 FOREIGN KEY (idCentro) REFERENCES CentroDeEstudiantes(idCentro)
);

create table Aulas (
nDeAula int not null primary key,
capacidad int,
idMateria INT,
idEst INT,
CONSTRAINT fkMateria FOREIGN KEY (idMateria) REFERENCES Materias(idMateria),
CONSTRAINT fkEst3 FOREIGN KEY (idEst) REFERENCES Establecimiento(idEst)
);

create table Laboratorios (
nDeLab int not null primary key,
capacidad int,
idMateria INT,
idEst INT,
CONSTRAINT fkMateria2 FOREIGN KEY (idMateria) REFERENCES Materias(idMateria),
CONSTRAINT fkEst4 FOREIGN KEY (idEst) REFERENCES Establecimiento(idEst)
);

create table Baños (
nDeBaño int not null primary key,
genero varchar(45),
idEst INT,
CONSTRAINT fkEst5 FOREIGN KEY (idEst) REFERENCES Establecimiento(idEst)
);

insert into centrodeestudiantes values (1);
insert into establecimiento values (1, 1);

insert into especialidades values (1, "Ingenieria Informatica", 1);
insert into especialidades values (2, "Maestro Mayor de Obra", 1);
insert into especialidades values (3, "Electromecanica", 1);

insert into preceptores values (1, "Julio", "Ruiz");
insert into preceptores values (2, "Mario", "Perez");

insert into directores values (1, "Maria", "Pereyra", 1);

insert into profesores values (1, "Juan", "Rodrigo");
insert into profesores values (2, "Erica", "Marta");
insert into profesores values (3, "Elvira", "Olivos");

insert into cursos values (21, 2, 1, 2);
insert into cursos values (53, 5, 3, 1);
insert into cursos values (42, 4, 2, 1);

insert into materias values (1, "Hardware 2do 1ra", 21, 1, 3);
insert into materias values (2, "Arquitectura 4to 2da", 42, 2, 2);
insert into materias values (3, "Circuitos 5to 3ra", 53, 3, 1);

insert into Alumnos values (1, "Benito", "Rodriguez", 15, 42, 1); 
insert into Alumnos values (4, "Milo", "Sosa", 16, 42, 1); 
insert into Alumnos values (2, "Olivia", "Sanchez", 17, 53, 1);
insert into Alumnos values (3, "Jose", "Rodriguez", 13, 21, 1); 

insert into Aulas values (1, 32, 2 ,1);
insert into laboratorios values (5, 16, 1 ,1);
insert into laboratorios values (7, 20, 3 ,1);